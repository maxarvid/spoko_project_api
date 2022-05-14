RSpec.describe 'PUT orders with a status of finalized ', type: :request do
  let(:user) { create(:user) }
  let(:editor) { create(:user, role: :editor) }
  let(:product) { create(:product) }
  let(:member_credentials) { user.create_new_auth_token }
  let(:editor_credentials) { editor.create_new_auth_token }
  subject { response }

  describe 'successfully' do
    before do
      post '/api/orders', params: {
        order: {
          product_id: product.id, user_id: user.id
        }
      }, headers: member_credentials
    end

    it 'responds with 201 status' do
      expect(response.status).to eq 201
    end

    # it 'set the order attribute "finalized" to be true' do
    #   expect(order.finalized).to eq true
    # end
  end
end
