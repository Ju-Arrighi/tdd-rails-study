FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order number - #{n}"}
    # association :customer, factory: customer (subcrever)
    customer
  end

end
