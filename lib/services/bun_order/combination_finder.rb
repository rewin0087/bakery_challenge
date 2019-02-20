module BunOrder
  class CombinationFinder
    BunPackageNotAvailable  ||= Class.new(StandardError)
    MinimumQuantityNotReach ||= Class.new(StandardError)

    attr_reader :bun_code, :combinations, :quantity

    def initialize
      @combinations = []
    end

    def call(quantity, bun_code)
      @bun_code = bun_code
      @quantity = quantity

      validate_inputs
      find_combination(available_bun_packages, quantity)
      self
    end

    private

      def find_combination(bun_packages, target_quantity, current_combination = [])
        current_quantity = current_combination.sum(&:quantity)
        @combinations = current_combination if current_quantity == target_quantity
        return if current_quantity >= target_quantity || !@combinations.empty?

        bun_packages.map.with_index do |package, i|
          remaining_packages = bun_packages[i..-1]
          find_combination(remaining_packages, target_quantity, current_combination + [package])
        end
      end

      def available_bun_packages
        @available_bun_packages ||= available_bun_package.packages
      end

      def minimum_quantity
        @minimum_quantity ||= available_bun_package.minimum_quantity
      end

      def available_bun_package
        @available_bun_package ||=  AvailableBunPackageFinder.new(bun_code)
      end

      def validate_inputs
        raise BunPackageNotAvailable, bun_code if available_bun_packages.empty?
        raise MinimumQuantityNotReach, quantity if minimum_quantity > quantity
      end
  end
end