RSpec.describe 'POST /api/orders', type: :request do
  let!(:user) { create(:user) }
  let(:product) { create(:product) }
  subject { response }
  before do
    post '/api/orders', params: {
      order:
       { product_id: product.id, user_id: user.id }
    }
    @order = Order.last
  end

  it { is_expected.to have_http_status :created }

  it 'is expected to create an instance of Order' do
    expect(@order).to_not eq nil
  end

  it 'is expected to associate order with user' do
    expect(@order.user).to eq user
  end

  it 'is expected to create an order_item' do
    expect(@order.items).to_not eq nil
  end

  it 'is expected to associate the product with order' do
    expect(@order.products.first).to eq product
  end

  it 'is expected to include order_id in the response body' do
    expect(response_json['order']['id']).to eq @order.id
  end
end