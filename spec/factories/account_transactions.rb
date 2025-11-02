FactoryBot.define do
  factory :account_transaction do
    sequence(:uuid) { |n| SecureRandom.uuid }
    date { Faker::Date.between(from: 90.days.ago, to: Date.today) }
    amount_cents { Faker::Number.between(from: -10000, to: -100) }
    amount_currency { "USD" }
    description { Faker::Company.name }
    status { ["posted", "pending", "cleared"].sample }
    association :account, factory: :bank_account
    remote_data { { "id" => uuid } }

    trait :with_category do
      association :category
    end

    trait :credit_card do
      association :account, factory: :credit_card
    end

    trait :positive_amount do
      amount_cents { Faker::Number.between(from: 100, to: 10000) }
    end

    trait :expense do
      amount_cents { Faker::Number.between(from: -10000, to: -100) }
    end
  end
end
