RSpec.describe 'GET /api/products' do
  let!(:products) { 5.times { create(:product) } }

  before do
    get '/api/products'
  end

  subject { response }

  it { is_expected.to have_http_status 200 }

  it 'is expected to return a collection of products' do
    expect(response_json['products'].count).to eq 5
  end

  it 'is expected to return products names' do
    expect(response_json['products'].first['name']).to eq 't-shirt'
  end

  it 'is expected to return products size' do
    expect(response_json['products'].first['size']).to eq 'large'
  end
end
