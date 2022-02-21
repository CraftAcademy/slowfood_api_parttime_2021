RSpec.describe 'POST /api/carts', type: :request do
  let!(:user) { create(:user) }
  let!(:products) { create(:product) }
  subject { response }
  before do
    post '/api/carts'
  end

  it { is_expected.to have_http_status :created }

  it 'is expected to create an instance of Cart' do
    expect(@cart).to_not eq nil
  end

  it 'is expected to associate order with user' do
    expect(@order.user).to eq user
  end

  it 'is expected to create an cart_item' do
    expect(@cart.items).to_not eq nil
  end

  it 'is expected to associate the product with cart' do
    expect(@cart.products.first).to eq product
  end

  it 'is expected to include cart_id in the response body' do
    expect(response_json['cart']['id']).to eq @cart.id
  end
end