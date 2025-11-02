FactoryBot.define do
  factory :category do
    name { Faker::Commerce.unique.product_name }
    association :category_group
  end
end
