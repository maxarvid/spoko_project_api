RSpec.describe "GET /api/articles", type: :request do

  let(:team_category) { create(:category, name: 'Team')}
  let(:matches_category) { create(:category, name: 'Matches')}
  let!(:team_articles) { create_list(:article, 5, category: team_category) }
  let!(:matches_articles) { create_list(:article, 5, category: matches_category) }

  before do
    get '/api/articles'
  end

  subject { response }

  it { is_expected.to have_http_status 200 }

  it 'is expected to return articles grouped by category' do
    expect(response_json['articles'].keys).to match ['team', 'matches']
  end

  it 'is expected to include 5 articles in the team category' do
    expect(response_json['articles']['team'].size).to eq 5
  end

end
