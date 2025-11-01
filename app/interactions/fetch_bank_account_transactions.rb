class FetchBankAccountTransactions < ActiveInteraction::Base
  string :bank_account_id
  integer :page, default: 1

  def execute
    JSON.parse(fetch_bank_account_transactions)
  end

  private

  def fetch_bank_account_transactions
    Faraday.get(
      "https://take-home-11tn.onrender.com/bank_accounts/#{bank_account_id}/transactions",
      { page: page },
      { "Authorization" => "finta-take-home" }
    ).body
  end
end
