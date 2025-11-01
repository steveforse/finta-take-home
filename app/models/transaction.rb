class Transaction < ApplicationRecord
  monetize :amount_cents, with_model_currency: :amount_currency
  belongs_to :account, polymorphic: true
end
