module BunOrder
  class AvailableBunPackageFinder
    attr_reader :packages, :bun_code, :store

    def initialize(bun_code)
      @store = DataStore.()
      @bun_code = bun_code
    end

    def minimum_quantity
      @minimum_quantity ||= packages.last.quantity
    end

    def packages
      @packages ||= store.bun_packages
        .select { |pack| pack.code == bun_code }
        .sort_by(&:quantity)
        .reverse
    end
  end
end
