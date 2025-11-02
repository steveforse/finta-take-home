class FetchCreditCardTransactions < ActiveInteraction::Base
  string :credit_card_id
  integer :page, default: 1

  def execute
    JSON.parse(fetch_credit_card_transactions(credit_card_id))
  end

  private

  def fetch_credit_card_transactions(credit_card_id)
    Faraday.get(
      "https://take-home-11tn.onrender.com/credit_cards/#{credit_card_id}/transactions",
      { page: page },
      { "Authorization" => "finta-take-home" }
    ).body
  end
end
