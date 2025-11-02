FactoryBot.define do
  factory :credit_card do
    sequence(:uuid) { |n| SecureRandom.uuid }
    name { "#{Faker::Company.name} #{Faker::Bank.name}" }
    last_4 { Faker::Number.number(digits: 4).to_s }
    brand { ["Visa", "Mastercard", "American Express", "Discover"].sample }
    expiration_month { Faker::Number.between(from: 1, to: 12) }
    expiration_year { Faker::Number.between(from: 2024, to: 2030) }
  end
end
