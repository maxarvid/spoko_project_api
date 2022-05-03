RSpec.describe Order, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  end

  describe 'Factory' do
    it 'is expected to have a valid factory' do
      expect(create(:order)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:items).class_name("OrderItem") }
  end
end
