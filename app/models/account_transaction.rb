class AccountTransaction < ApplicationRecord
  belongs_to :account, polymorphic: true
  belongs_to :category, optional: true

  monetize :amount_cents, with_model_currency: :amount_currency

  validates :uuid, presence: true, uniqueness: true
  validates :amount_cents, presence: true
  validates :amount_currency, presence: true
  validates :date, presence: true
end
