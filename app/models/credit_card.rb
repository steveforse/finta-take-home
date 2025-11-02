class CreditCard < ApplicationRecord
  has_many :transactions, as: :account, dependent: :destroy

  validates :uuid, presence: true, uniqueness: true
end
