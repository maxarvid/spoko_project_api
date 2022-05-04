RSpec.describe 'Create an order with POST /api/orders', type: :request do
  let(:user) { create(:user) }
  let(:editor) { create(:user, role: 1) }
  let(:product) { create(:product) }
  subject { response }

  describe 'successfully' do
    before do
      post '/api/orders', params: {
        order: {
          product_id: product.id, user_id: user.id
        }
      }
      @order = Order.last
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to create an instance of Order' do
      expect(@order).to_not eq nil
    end

    it 'is expected to associate an Order with user' do
      expect(@order.user).to eq user
    end

    it 'is expected to create an order_item' do
      expect(@order.items).to_not eq nil
    end

    it 'is expected to assocaite the product with an order ' do
      expect(@order.products.first).to eq product
    end
  end

  describe 'unsuccessfully' do
    before do
      post '/api/orders', params: {
        order: {
          product_id: product.id, user_id: editor.id
        }
      }
    end

    it { binding.pry; is_expected.to have_http_status 401 }

    it 'is expected to respond with an error message' do
      expect(response_json['error']).to eq 'You are not permitted to perform that action'
    end
  end
end
