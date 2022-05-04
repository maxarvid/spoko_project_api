RSpec.describe 'Create an order with POST /api/orders', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  subject { response }

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
  
  it 'is expected to include an Order ID in the response ' do
    response_body = JSON.parse(response.body)
    expect(response_body['order']['id']).to eq @order.id
  end

  # it 'is expected to include an order items  in the response ' do
  #   response_body = JSON.parse(response.body)
  #   expect(response_body['order']['id']).to eq @order.product
  # end


end

# Respond to include the order and order itesm so that this infor can be used on the client side
# minimum is to include the order ID in response
