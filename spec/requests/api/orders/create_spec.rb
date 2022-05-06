RSpec.describe 'Create an order with POST /api/orders', type: :request do
  subject { response }
  let(:user) { create(:user) }
  let(:editor) { create(:user, role: :editor) }
  let(:product) { create(:product) }
  let(:member_credentials) { user.create_new_auth_token }
  let(:editor_credentials) { editor.create_new_auth_token }

  describe 'succesful ' do
    before do
      post '/api/orders', params: {
        order: {
          product_id: product.id, user_id: user.id
        }
      }, headers: member_credentials

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

    it 'is expected to include an Order ID in the response ' do
      expect(response_json['order']['id']).to eq @order.id
    end
  end

  describe 'unsuccesful ' do
    before do
      post '/api/orders', params: {
        order: {
          product_id: product.id, user_id: editor.id
        }
      }, headers: editor_credentials
    end

    it { is_expected.to have_http_status 401 }

    it 'is expected to respond with an error message' do
      expect(response_json['errors']).to eq 'you are not authorized to perform this action'
    end
  end
end
