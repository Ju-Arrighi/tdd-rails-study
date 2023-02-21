require 'rails_helper'

RSpec.describe Customer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  fixtures :customers
  it 'have a name and a email' do
    customer = customers(:juliana)
    expect(customer.full_name).to eq('Sra. Juliana Arrighi')
  end
end
