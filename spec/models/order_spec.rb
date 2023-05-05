require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'create order with costumer reference' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'create list of 5 orders' do
    orders = create_list(:order, 5)
    puts orders.inspect
    expect(orders.count).to eq(5)
  end
end
