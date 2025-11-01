class FetchBankAccountTransactions < ActiveInteraction::Base
  string :account_id

  def execute
    JSON.parse(fetch_bank_account_transactions)
  end

  private

  def fetch_bank_account_transactions
    Faraday.get(
      "https://take-home-11tn.onrender.com/bank_accounts/#{account_id}/transactions",
      nil,
      { "Authorization" => "finta-take-home" }
    ).body
  end
end
