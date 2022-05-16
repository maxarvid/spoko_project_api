RSpec.describe 'GET /api/products/:id' do
  let!(:product) { create(:product, name: 'tshirt') }

  subject { response }

  describe 'succesful' do
    before do
      get "/api/products/#{product.id}"
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return the requested product name' do
      expect(response_json['product']['name']).to eq 'tshirt'
    end

    it 'is expected to return only one product' do
      expect(response_json['product'].is_a?(Hash)).to eq true
    end

    it 'is expected to return a rating for the product' do
      expect(response_json['product']['rating']).to eq 3.8
    end
  end

  describe 'unsuccesful' do
    before do
      get '/api/products/9999999'
    end

    it { is_expected.to have_http_status 422 }

    it 'is expected to return an error message' do
      expect(response_json['error']).to eq 'No such item exists'
    end
  end
end
