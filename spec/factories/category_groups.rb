FactoryBot.define do
  factory :category_group do
    name { Faker::Commerce.unique.department }

    trait :expenses do
      name { "Expenses" }
    end

    trait :income do
      name { "Income" }
    end
  end
end
