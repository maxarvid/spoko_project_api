RSpec.describe Rating, type: :model do
  describe 'Products database Table check' do
    it { is_expected.to have_db_column(:score).of_type(:float) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :score }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :product }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:rating)).to be_valid
    end
  end
end
