class Category < ApplicationRecord
  belongs_to :category_group
  has_many :account_transactions, dependent: :nullify

  validates :name, presence: true
  validates :name, uniqueness: { scope: :category_group_id, message: "already exists in this group" }
end
