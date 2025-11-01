class UpsertBankAccounts < ActiveInteraction::Base
  def execute
    upsert_bank_accounts
  end

  private

  def bank_accounts
    @bank_accounts ||= FetchBankAccounts.run!["data"]
  end

  def upsert_bank_accounts
    bank_accounts.each do |bank_account|
      BankAccount
        .find_or_initialize_by(uuid: bank_account["uuid"])
        .update(bank_account)
    end
  end
end
