require 'utils'
describe Backery do
  describe '.purchase_bun' do
    subject { described_class.purchase_bun(quantity, bun_code) }

    context 'bun_code VS5' do
      let(:bun_code) { 'VS5' }
      let(:quantity) { 10 }

      it 'display bun packages combinations' do
        expect(subject[:total]).to eq(17.98)
        expect(subject[:code]).to eq('VS5')
        expect(subject[:quantity]).to eq(10)
        expect(subject[:packages].count).to eq(1)
        packages = subject[:packages]

        package_1 = packages.shift
        expect(package_1[:count]).to eq(2)
        expect(package_1[:quantity]).to eq(5)
        expect(package_1[:price]).to eq(8.99)
      end
    end

    context 'bun_code CF' do
      let(:bun_code) { 'CF' }
      let(:quantity) { 13 }

      it 'display bun packages combinations' do
        expect(subject[:total]).to eq(25.85)
        expect(subject[:code]).to eq('CF')
        expect(subject[:quantity]).to eq(13)
        expect(subject[:packages].count).to eq(2)
        packages = subject[:packages]

        package_1 = packages.shift
        expect(package_1[:count]).to eq(2)
        expect(package_1[:quantity]).to eq(5)
        expect(package_1[:price]).to eq(9.95)

        package_2 = packages.shift
        expect(package_2[:count]).to eq(1)
        expect(package_2[:quantity]).to eq(3)
        expect(package_2[:price]).to eq(5.95)
      end
    end

    context 'bun_code MB11' do
      let(:bun_code) { 'MB11' }
      let(:quantity) { 14 }

      it 'display bun packages combinations' do
        expect(subject[:total]).to eq(54.8)
        expect(subject[:code]).to eq('MB11')
        expect(subject[:quantity]).to eq(14)
        expect(subject[:packages].count).to eq(2)
        packages = subject[:packages]

        package_1 = packages.shift
        expect(package_1[:count]).to eq(1)
        expect(package_1[:quantity]).to eq(8)
        expect(package_1[:price]).to eq(24.95)

        package_2 = packages.shift
        expect(package_2[:count]).to eq(3)
        expect(package_2[:quantity]).to eq(2)
        expect(package_2[:price]).to eq(9.95)

      end
    end
  end
end