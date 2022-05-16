RSpec.describe 'PUT orders with a status of finalized ', type: :request do
  let(:user) { create(:user) }
  let(:editor) { create(:user, role: :editor) }
  let(:product) { create(:product) }
  let(:member_credentials) { user.create_new_auth_token }
  let(:editor_credentials) { editor.create_new_auth_token }
  let(:order) { create(:order) }

  subject { response }

  describe 'status during order' do
    before do
      put "/api/orders/#{order.id}", params: {
        order: {
          product_id: product.id, user_id: user.id,
          activity: 'finalize'
        }
      }, headers: member_credentials
      @order = Order.last
    end

    it 'responds with 201 status' do
      expect(response.status).to eq 201
    end

    it 'set the order attribute "finalised" to be false during order' do
      expect(@order.Finalised).to eq false
    end
  end

  describe 'status when order finalised ' do
    before do
      post '/api/orders', params: { order: { product_id: product.id, user_id: user.id, Finalised: true } },
                          headers: member_credentials
      @order = Order.last
    end

    it 'set the order attribute "true" when an order is complete' do
      expect(@order.Finalised).to eq true
    end
  end
end
