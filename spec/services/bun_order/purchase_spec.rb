require 'utils'

describe BunOrder::Purchase do
  let(:quantity) { 10 }
  let(:bun_code) { 'VS5' }

  subject { described_class.new.(quantity, bun_code) }

  describe '#call' do
    it 'returns formatted results' do
      expect(subject[:total]).to eq(17.98)
      expect(subject[:code]).to eq(bun_code)
      expect(subject[:packages].size).to eq(1)
      expect(subject[:quantity]).to eq(quantity)
      packages = subject[:packages]

      package_1 = packages.shift
      expect(package_1[:count]).to eq(2)
      expect(package_1[:quantity]).to eq(5)
      expect(package_1[:price]).to eq(8.99)
    end
  end
end