class FetchBankAccounts < ActiveInteraction::Base
  def execute
    JSON.parse(fetch_accounts)
  end

  private

  def fetch_accounts
    Faraday.get(
      "https://take-home-11tn.onrender.com/bank_accounts",
      nil,
      { "Authorization" => "finta-take-home" }
    ).body
  end
end
