RSpec.describe 'Update an order with a PUT /api/orders/:id', type: :request do
  let(:user) { create(:user) }
  let(:product_1) { create(:product, name: 'Tshirt') }
  let(:product_2) { create(:product, name: 'Football') }
  let(:product_3) { create(:product, name: 'Scarf') }
  let(:order) { create(:order) }
  let!(:order_item_1) { create(:order_item, order:, product: product_2) }
  let!(:order_item_2) { create(:order_item, order:, product: product_3) }

  subject { response }

  before do
    put "/api/orders/#{order.id}", params: { product_id: product_2.id }

    @order = Order.last
  end

  it { is_expected.to have_http_status :ok }

  it 'response with an order confirmation' do
    response_body = JSON.parse(response.body)
    expect(response_body['message']).to eq 'Football added'
  end

  it 'is expected to contain 3 items' do
    expect(@order.items.count).to eq 3
  end
end
