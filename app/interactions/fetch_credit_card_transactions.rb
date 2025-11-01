class FetchCreditCardTransactions < ActiveInteraction::Base
  string :card_id

  def execute
    JSON.parse(fetch_credit_card_transactions(card_id))
  end

  private

  def fetch_credit_card_transactions(card_id)
    Faraday.get(
      "https://take-home-11tn.onrender.com/credit_cards/#{card_id}/transactions",
      nil,
      { "Authorization" => "finta-take-home" }
    ).body
  end
end
