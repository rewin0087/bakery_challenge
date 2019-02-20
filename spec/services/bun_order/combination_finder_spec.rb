require 'utils'

describe BunOrder::CombinationFinder do
  let(:quantity) { 10 }
  let(:bun_code) { 'VS5' }

  subject { described_class.new.(quantity, bun_code) }

  describe '#class' do
    context 'returns best bun_packages combinations' do
      it do
        expect(subject.combinations.size).to eq(2)
        combinations = subject.combinations

        bun_package_1 = combinations.shift
        expect(bun_package_1.quantity).to eq(5)
        expect(bun_package_1.price).to eq(8.99)
        expect(bun_package_1.code).to eq(bun_code)

        bun_package_2 = combinations.shift
        expect(bun_package_2.quantity).to eq(5)
        expect(bun_package_2.price).to eq(8.99)
        expect(bun_package_2.code).to eq(bun_code)
      end
    end

    context 'returns quanity' do
      it { expect(subject.quantity).to eq(quantity) }
    end

    context 'returns bun_code' do
      it { expect(subject.bun_code).to eq(bun_code) }
    end

    context 'non-existing bun code' do
      let(:bun_code) { nil }

      it { expect { subject }.to raise_error(BunOrder::CombinationFinder::BunPackageNotAvailable) }
    end

    context 'below minimum quantity' do
      let(:quantity) { 1 }

      it { expect { subject }.to raise_error(BunOrder::CombinationFinder::MinimumQuantityNotReach) }
    end
  end
end