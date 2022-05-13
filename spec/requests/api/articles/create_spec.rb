RSpec.describe 'Request spect, create articles - POST /api/articles' do
  let(:user) { create(:user) }
  let!(:team_category) { create(:category, name: 'Team') }
  let(:member_credentials) { user.create_new_auth_token }

  subject { response }

  describe ' Happy path for create articles with image attachment' do
    before do
      post '/api/articles', params: {
        article: {
          title: 'News about Spoko',
          body: 'We are the champions of the World',
          image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzwAAAMuCAYAAADc6AZ',
          category: 'Team'
        }
      }, headers: member_credentials
      @article = Article.last
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to create an instance of an Article with a tile, body' do
      expect(@article).not_to be nil
      expect(@article.title).to eq 'News about Spoko'
      expect(@article.body).to eq 'We are the champions of the World'
    end

    it 'is expected to attach an image to the article' do
      expect(@article.image.attached?).to eq true
    end
  end

  describe 'Sad path for create articles with not credentials ' do
    before do
      post '/api/articles', params: {
        article: {
          title: 'News about Spoko',
          body: 'We are the champions of the World'
        }
      }
    end

    describe 'is expected to return an unauthorised response' do
      it { is_expected.to have_http_status 401 }
    end
  end

  describe 'Sad path for create articles with missing params ' do
    before do
      post '/api/articles', params: { article: {} }, headers: member_credentials
    end

    describe 'is expected to return an unauthorised response' do
      it { is_expected.to have_http_status 422 }
    end

    it 'is expected to respond with an error message' do
      expect(response_json['error']).to eq 'Invalid entry'
    end
  end
end
