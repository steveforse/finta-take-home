class CreditCard < ApplicationRecord
  has_many :account_transactions, as: :account, dependent: :destroy

  validates :uuid, presence: true, uniqueness: true
end
