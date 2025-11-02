require 'rails_helper'

RSpec.describe AccountTransaction, type: :model do
  # Associations
  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:category).optional }

  # Validations
  it { is_expected.to validate_presence_of(:uuid) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:amount_cents) }
  it { is_expected.to validate_presence_of(:amount_currency) }


  describe "polymorphic account association" do
    it "works with bank accounts" do
      bank_account = create(:bank_account)
      transaction = create(:account_transaction, account: bank_account)

      expect(transaction.account).to eq(bank_account)
      expect(transaction.account_type).to eq("BankAccount")
    end

    it "works with credit cards" do
      credit_card = create(:credit_card)
      transaction = create(:account_transaction, account: credit_card)

      expect(transaction.account).to eq(credit_card)
      expect(transaction.account_type).to eq("CreditCard")
    end
  end

  describe "money-rails integration" do
    it "converts amount_cents to Money object" do
      transaction = create(:account_transaction, amount_cents: 1250, amount_currency: "USD")

      expect(transaction.amount).to be_a(Money)
      expect(transaction.amount.cents).to eq(1250)
      expect(transaction.amount.currency.iso_code).to eq("USD")
    end
  end

  describe "factory" do
    it "has a valid factory" do
      expect(build(:account_transaction)).to be_valid
    end

    it "creates transaction with category" do
      transaction = build(:account_transaction, :with_category)
      expect(transaction.category).to be_present
    end
  end
end
