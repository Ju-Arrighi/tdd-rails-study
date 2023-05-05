require 'rails_helper'

RSpec.describe Customer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # fixtures :customers
  # customer = customers(:juliana)
  it '#full_name - sobrescrevendo atributo' do
    customer = create(:customer, name: 'Juliana Arrighi')
    expect(customer.full_name).to eq('Sr. Juliana Arrighi')
  end

  it '#full_name' do
    customer = create(:user) # customer alias
    expect(customer.full_name).to start_with('Sr.')
  end

  it { expect{ create(:customer) }.to change{ Customer.all.size }.by(1) }

  it '#herança' do
    customer = create(:customer, :vip)
    expect(customer.vip).to eq(true)
  end

  it 'attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with('Sr.')
  end

  it 'transient attributes' do
    customer = create(:customer, :default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'customer female vip' do
    customer = create(:customer_vip_female)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'customer male' do
    customer = create(:customer_default_male)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(false)
  end
end
