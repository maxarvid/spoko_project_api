RSpec.describe 'GET /api/products/:id' do
    describe "succesful" do 
    let!(:product) {create(:product, name: 'tshirt')}

    before do
      get "/api/products/#{product.id}"
    end
  
    subject { response }
  
    it { is_expected.to have_http_status 200 }


    it 'is expected to return the requested product names ' do
        expect(JSON.parse(response.body)['product']['name']).to eq "tshirt"
      end

    end

  end