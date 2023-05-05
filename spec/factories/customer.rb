FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }

    trait :vip do
      vip { true }
      days_to_pay { 15 }
    end

    trait :default do
      vip { false }
      days_to_pay { 30 }
    end

    trait :female do
      gender { 'F' }
    end

    trait :male do
      gender { 'M' }
    end

    factory :customer_female, traits: [:female]
    factory :customer_male, traits: [:male]
    factory :customer_default_female, traits: [:female, :default]
    factory :customer_default_male, traits: [:male, :default]
    factory :customer_vip_female, traits: [:female, :vip]
    factory :customer_vip_male, traits: [:male, :vip]

    after(:create) do | customer, evaluator |
      customer.name.upcase! if evaluator.upcased
    end
  end
end
