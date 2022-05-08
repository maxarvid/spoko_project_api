RSpec.describe 'POST /api/articles' do

  let(:team_category) { create(:category, name: 'Team')}
  let(:matches_category) { create(:category, name: 'Matches')}
  let!(:team_articles) { create_list(:article, 5, category: team_category) }
  let!(:matches_articles) { create_list(:article, 5, category: matches_category) }

  

  before do
    post '/api/articles', params: {
      article: { title: 'News about Spoko', body: 'We are the champions of the World', image: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOoAAADfCAYAAAD4I09QAAABP2lDQ1BJQ0MgUHJvZmlsZQAAKJFjYGASSCwoyGFhYGDIzSspCnJ3UoiIjFJgf8bAysABhJIM3InJxQWOAQE+QCUMMBoVfLvGwAiiL"
    }
    @article = Article.last
  end

  subject { response }

  it { is_expected.to have_http_status 201 }

  it 'is expected to create an instance of an Article' do
    expect(@article).not_to be nil
  end

  it 'is expected to have a title' do
    expect(@article.title).to eq 'News about Spoko'
  end

  it 'is expected to have a body' do
    expect(@article.body).to eq 'We are the champions of the World'
  end

  it "is expected to attach an image to the article" do
    expect(@article.image).to be_attached
  end

end 
