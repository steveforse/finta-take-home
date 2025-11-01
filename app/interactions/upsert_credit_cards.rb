class UpsertCreditCards < ActiveInteraction::Base
  def execute
    upsert_credit_cards
  end

  private

  def credit_cards
    @credit_cards ||= FetchCreditCards.run!["data"]
  end

  def upsert_credit_cards
    credit_cards.each do |credit_card|
      CreditCard
        .find_or_initialize_by(uuid: credit_card["uuid"])
        .update(credit_card)
    end
  end
end
