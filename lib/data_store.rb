require 'json'

class DataStore
  attr_reader :buns, :bun_packages

  def initialize
    @buns = []
    @bun_packages = []
  end

  def self.call
    @store ||= new.()
  end

  def call
    seed_data['buns'].map(&method(:seed_bun))
    self
  end

  private

    def seed_bun(data)
      bun = Bun.new(data['name'])
      @buns << bun

      data['packs'].each do |pack|
        @bun_packages << BunPackage.new(bun, data['code'], pack['quantity'], pack['price'])
      end
    end

    def seed_data
      @seed_data ||= JSON.parse(seed_file)
    end

    def seed_file
      @seed_file ||= File.read(File.join(File.dirname(__dir__), 'lib', 'data', 'buns.json'))
    end
end
