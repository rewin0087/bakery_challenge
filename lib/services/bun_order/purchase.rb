module BunOrder
  class Purchase
    attr_reader :quantity, :bun_code

    def call(quantity, bun_code)
      @quantity = quantity
      @bun_code = bun_code

      Representers::PurchasedBunPackages.new.(
        bun_package_combination.combinations,
        quantity,
        bun_code
      )
    end

    private

      def bun_package_combination
        @bun_package_combination ||= CombinationFinder.new.(quantity, bun_code)
      end
  end
end

