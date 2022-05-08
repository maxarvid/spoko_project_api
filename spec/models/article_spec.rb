RSpec.describe Article, type: :model do
  describe 'Database' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:body).of_type(:text) }
    it { is_expected.to have_db_column(:author).of_type(:string) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :category }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:article)).to be_valid
    end
  end

  describe 'Attachment' do
    it 'is expected to be valid' do
      subject.image.attach(
        io: File.open(fixture_path + '/football.png'),
        filename: 'attachment',
        content_type: 'image/png'
      )
      expect(subject.image).to be_attached
    end
  end
end
