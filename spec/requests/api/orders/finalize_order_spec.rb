RSpec.describe 'PUT orders with a status of finalised ', type: :request do
  let(:user) { create(:user) }
  let(:editor) { create(:user, role: :editor) }
  let(:product) { create(:product) }
  let(:member_credentials) { user.create_new_auth_token }
  let(:editor_credentials) { editor.create_new_auth_token }
  let!(:order) { create(:order) }

  subject { response }

  describe 'status when order finalised' do
    before do
      put "/api/orders/#{order.id}", params: {
        order: {
          product_id: product.id, user_id: user.id,
          activity: 'finalise'
        }
      }, headers: member_credentials
      @order = Order.last
    end

    it { is_expected.to have_http_status 200 }

    it 'set the order attribute "finalised" to true after updating order' do
      expect(@order.finalised).to eq true
    end
  end

  describe 'status before order finalised' do
    before do
      @order = Order.last
    end

    it 'set the order attribute "false" when an order is in progress' do
      expect(@order.finalised).to eq false
    end
  end
end
