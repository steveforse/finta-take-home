class BankAccount < ApplicationRecord
  has_many :transactions, as: :account, dependent: :destroy
end
