require 'utils'

describe BunOrder::AvailableBunPackageFinder do
  let(:bun_code) { 'VS5' }

  subject { described_class.new(bun_code) }

  describe '#minimum_quantity' do
    it { expect(subject.minimum_quantity).to eq(3) }
  end

  describe '#packages' do
    it 'returns bun packages' do
      expect(subject.packages.size).to eq(2)
      packages = subject.packages

      package_1 = packages.shift
      expect(package_1.quantity).to eq(5)
      expect(package_1.price).to eq(8.99)
      expect(package_1.code).to eq(bun_code)

      package_2 = packages.shift
      expect(package_2.quantity).to eq(3)
      expect(package_2.price).to eq(6.99)
      expect(package_2.code).to eq(bun_code)
    end
  end
end