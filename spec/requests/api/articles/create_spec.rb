RSpec.describe 'POST /api/articles' do
  # let(:user) { create(:user) }
  let(:team_category) { create(:category, name: 'Team') }
  let(:matches_category) { create(:category, name: 'Matches') }
  let!(:team_articles) { create_list(:article, 5, category: team_category) }
  let!(:matches_articles) { create_list(:article, 5, category: matches_category) }
  # let(:member_credentials) { user.create_new_auth_token }

  before do
    post '/api/articles', params: {
      article: {
        title: 'News about Spoko',
        body: 'We are the champions of the World',
        image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzwAAAMuCAYAAADc6AZ'
      }
    }
    @article = Article.last
  end

  subject { response }

  it { is_expected.to have_http_status 201 }

  it 'is expected to create an instance of an Article with a tile, body' do
    expect(@article).not_to be nil
    expect(@article.title).to eq 'News about Spoko'
    expect(@article.body).to eq 'We are the champions of the World'
  end

  it 'is expected to attach an image to the article' do
    expect(@article.image).to eq 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAzwAAAMuCAYAAADc6AZ'
  end

  it "is expected to attach an image to the article" do
     expect(@article.image.attached?).to eq true
   end

  
end
