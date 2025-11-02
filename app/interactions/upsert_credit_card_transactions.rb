class UpsertCreditCardTransactions < ActiveInteraction::Base
  string :credit_card_id

  def execute
    upsert_credit_card_transactions
  end

  private

  def cursor
    @cursor ||= RemoteCreditCardTransactions.new(credit_card_id:)
  end

  def upsert_credit_card_transactions
    transactions = cursor.transactions
    upsert_batch(transactions)

    while(cursor.has_next?)
      upsert_batch(cursor.next_page)
    end
  end

  def upsert_batch(transactions)
    transactions.each do |transaction|
      ap transaction
      AccountTransaction
        .find_or_initialize_by(uuid: transaction["uuid"])
        .update(
          date: Time.at(transaction["date"]),
          amount_cents: transaction["amount_cents"],
          amount_currency: "USD",
          description: transaction["description"],
          status: transaction["status"],
          account_type: "BankAccount",
          account_id: CreditCard.find_by(uuid: transaction["credit_card_id"]).id,
          remote_data: transaction,
        )
    end
  end
end
