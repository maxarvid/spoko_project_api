RSpec.describe Order, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:finalised).of_type(:boolean) }
  end

  describe 'Factory' do
    it 'is expected to have a valid factory' do
      expect(create(:order)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:items).class_name('OrderItem') }
  end

  describe 'Instances methods' do
    describe 'serialized' do
      let(:product_1) { create(:product, name: 'Tshirt') }
      let(:product_2) { create(:product, name: 'Football') }
      let(:product_3) { create(:product, name: 'Scarf') }
      let(:order) { create(:order) }
      let!(:order_item_1) { create(:order_item, order:, product: product_1) }
      let!(:order_item_2) { create(:order_item, order:, product: product_2) }
      let!(:order_item_3) { create(:order_item, order:, product: product_3) }
      it { is_expected.to respond_to :serialized }

      it 'expected to give a JSON repsonse including 3 items ' do
        expect(order.serialized[:products].length).to eq 3
      end
    end
  end
end
