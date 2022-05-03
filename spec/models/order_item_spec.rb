RSpec.describe OrderItem, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer) }
    it { is_expected.to have_db_column(:product_id).of_type(:integer) }
  end

  describe 'Factory' do
    it 'is expected to have a valid factory' do
      expect(create(:order_item)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end
end
