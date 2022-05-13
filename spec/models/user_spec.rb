RSpec.describe User, type: :model do
  
  describe 'Database table' do
    it { is_expected.to have_db_column(:role).of_type(:integer) }
  end

  describe 'Factory' do
    it 'is expected to have a valid factory' do
      expect(create(:user)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:orders) }
  end
end
