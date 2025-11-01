class FetchCreditCards < ActiveInteraction::Base
  def execute
    JSON.parse(fetch_credit_cards)
  end

  private

  def fetch_credit_cards
    Faraday.get(
      "https://take-home-11tn.onrender.com/credit_cards",
      nil,
      { "Authorization" => "finta-take-home" }
    ).body
  end
end
