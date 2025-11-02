class Category < ApplicationRecord
  belongs_to :category_group
  has_many :transactions, dependent: :nullify
end
