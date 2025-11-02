FactoryBot.define do
  factory :bank_account do
    sequence(:uuid) { |n| SecureRandom.uuid }
    bank_name { Faker::Bank.name }
    account_number { Faker::Bank.account_number }
    routing_number { Faker::Bank.routing_number }
    display_name { "#{name} (#{bank_name})" }
  end
end
