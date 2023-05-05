require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to - create order with costumer reference' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'create_list - 5 orders' do
    orders = create_list(:order, 5)
    puts orders.inspect
    expect(orders.count).to eq(5)
  end

  it 'has_many' do
    # customer = create(:customer, :with_order, qtt_order: 5)
    customer = create(:customer_with_order)
    puts customer.orders.inspect
    puts customer.inspect
    expect(customer.orders.count).to eq(3)
  end
end
