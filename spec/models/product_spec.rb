RSpec.describe Product, type: :model do
  describe 'Products database Table check' do
    it { is_expected.to have_db_column(:size).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:float) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :size }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price }
  end

  describe 'Associations' do
    it { is_expected.to have_many :ratings }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:product)).to be_valid
    end
  end
end
