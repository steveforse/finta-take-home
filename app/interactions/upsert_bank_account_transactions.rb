class UpsertBankAccountTransactions < ActiveInteraction::Base
  string :bank_account_id

  def execute
    upsert_bank_account_transactions
  end

  private

  def cursor
    @cursor ||= RemoteBankAccountTransactions.new(bank_account_id: bank_account_id)
  end

  def upsert_bank_account_transactions
    transactions = cursor.transactions
    upsert_batch(transactions)

    while(cursor.has_next?)
      upsert_batch(cursor.next_page)
    end
  end

  def upsert_batch(transactions)
    transactions.each do |transaction|
      AccountTransaction
        .find_or_initialize_by(uuid: transaction["uuid"])
        .update(
          date: Time.at(transaction["date"]),
          amount_cents: transaction["amount_cents"],
          amount_currency: transaction["amount_currency"],
          description: transaction["description"],
          status: transaction["status"],
          account_type: "BankAccount",
          account_id: BankAccount.find_by(uuid: transaction["bank_account_id"]).id,
          remote_data: transaction,
        )
    end
  end
end
