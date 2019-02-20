module Representers
  class PurchasedBunPackages
    attr_reader :result, :bun_packages, :quantity, :bun_code

    def call(bun_packages, quantity, bun_code)
      @bun_packages = bun_packages
      @quantity = quantity
      @bun_code = bun_code

      result
    end

    private

      def result
        @result ||= {
          total: total,
          code: bun_code,
          packages: formatted_bun_packages,
          quantity: quantity
        }
      end

      def formatted_bun_packages
        @formatted_bun_packages ||= grouped_bun_packages.map do |quantity, packages|
          {
            count: packages.count,
            quantity: quantity,
            price: packages.first&.price.round(2)
          }
        end
      end

      def grouped_bun_packages
        @grouped_bun_packages ||= bun_packages.group_by(&:quantity)
      end

      def total
        @total ||= bun_packages.sum(&:price).round(2)
      end
  end
end