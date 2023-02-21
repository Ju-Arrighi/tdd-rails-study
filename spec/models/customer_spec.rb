require 'rails_helper'

RSpec.describe Customer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # fixtures :customers
  # customer = customers(:juliana)
  it 'have a name and a email' do
    customer = create(:customer)
    expect(customer.full_name).to eq('Sra. Juliana Arrighi')
  end
end
