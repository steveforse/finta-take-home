class SyncAllTransactions < ActiveInteraction::Base
  def execute
    sync_bank_accounts_and_transactions
    sync_credit_cards_and_transactions
  end

  private

  def sync_bank_accounts_and_transactions
    UpsertBankAccounts.run!

    BankAccount.find_each do |bank_account|
      UpsertBankAccountTransactions.run!(bank_account_id: bank_account.uuid)
    rescue => e
      Rails.logger.error("Failed to sync bank account #{bank_account.uuid}: #{e.message}")
    end
  end

  def sync_credit_cards_and_transactions
    UpsertCreditCards.run!

    CreditCard.find_each do |credit_card|
      UpsertCreditCardTransactions.run!(credit_card_id: credit_card.uuid)
    rescue => e
      Rails.logger.error("Failed to sync credit card #{credit_card.uuid}: #{e.message}")
    end
  end
end
