class RemoteCreditCardTransactions
  def initialize(credit_card_id: credit_card_id)
    @credit_card_id = credit_card_id
    @pagination = nil
    @current_page = 1
  end

  def transactions
    ap response
    @transactions = response["data"]
  end

  def pagination
    @pagination = @response["pagination"]
    @current_page = @pagination["current_page"]
    @pagination
  end

  def next_page
    @current_page += 1
    @response = nil
    transactions
  end

  def previous_page
    @current_page -= 1
    @current_page = [@current_page, 1].max
    @response = nil
    transactions
  end

  def total_pages
    pagination["total_pages"]
  end

  def total_count
    pagination["total_count"]
  end

  def has_next?
    pagination["has_next"]
  end

  def has_previous?
    pagination["has_prev"]
  end

  def current_page
    @current_page
  end


  private

  def response
    @response ||= FetchCreditCardTransactions.run!(
      credit_card_id: @credit_card_id,
      page: @current_page
    )
  end
end
