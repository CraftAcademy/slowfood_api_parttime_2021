RSpec.describe 'PUT /api/orders/', type: :request do
  let(:order) { create(:order) }
  let(:product_1) { create(:product) }
  let(:product_2) { create(:product) }

  subject { response }

  before do
    order.items.create(product: product_2, amount: 1)
    put "/api/orders/#{order.id}",
        params: { order: { product_id: product_1.id, amount: 2 } }
  end

  it { is_expected.to have_http_status 200 }

  it 'is expected to responed a message' do
    expect(response_json['message']).to eq "Your order was update with #{product_2.name}."
  end

  # it "is expected to add amount value to orderItem" do
  # expect(order.items.first.amount).to eq 2
  # end
end