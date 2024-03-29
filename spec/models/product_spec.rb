require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end
  it 'is invalid without description' do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end
  it 'is invalid without description' do
    product = build(:product, price: nil)
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end
  it 'is invalid without description' do
    product = build(:product, category: nil)
    product.valid?
    expect(product.errors[:category]).to include("can't be blank")
  end
  it 'returns a product full description' do
    product = create(:product)
    expect(product.full_description).to match("#{product.description} - #{product.price}")
  end
end

RSpec.describe Product, type: :model do
  context 'Validation with shoulda matchers' do
    describe 'validations' do
      it { should validate_presence_of(:description)}
      it { should validate_presence_of(:price)}
      # Alternative syntax
      it { is_expected.to validate_presence_of(:category)}
    end
  end

  context 'Associations with shoulda matchers' do
    describe 'associations' do
      it { should belong_to(:category)}
    end
  end

  context 'Instance Methods' do
    describe '#full_description' do
      it 'returns a product full description' do
        product = create(:product)
        expect(product.full_description).to match("#{product.description} - #{product.price}")
      end
    end
  end
end
