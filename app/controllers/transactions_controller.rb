class TransactionsController < ApplicationController
  def index
    @transactions = AccountTransaction.includes(:account, :category)

    # Filter by account type (bank or credit)
    if params[:account_type].present? && params[:account_type] != "all"
      account_class = params[:account_type] == "bank" ? BankAccount : CreditCard
      @transactions = @transactions.where(account_type: account_class.name)
    end

    # Filter by amount range
    if params[:min_amount].present?
      @transactions = @transactions.where("amount_cents >= ?", (params[:min_amount].to_f * 100).to_i)
    end

    if params[:max_amount].present?
      @transactions = @transactions.where("amount_cents <= ?", (params[:max_amount].to_f * 100).to_i)
    end

    # Filter by date range
    if params[:start_date].present?
      @transactions = @transactions.where("date >= ?", params[:start_date])
    end

    if params[:end_date].present?
      @transactions = @transactions.where("date <= ?", params[:end_date])
    end

    # Filter by text search (description)
    if params[:search].present?
      @transactions = @transactions.where("description ILIKE ?", "%#{params[:search]}%")
    end

    # Filter by category
    if params[:category_id].present?
      if params[:category_id] == "uncategorized"
        @transactions = @transactions.where(category_id: nil)
      else
        @transactions = @transactions.where(category_id: params[:category_id])
      end
    end

    # Sorting
    sort_column = params[:sort] || "date"
    sort_direction = params[:direction] || "desc"

    case sort_column
    when "amount"
      @transactions = @transactions.order("amount_cents #{sort_direction}")
    when "description"
      @transactions = @transactions.order("description #{sort_direction}")
    else
      @transactions = @transactions.order("date #{sort_direction}")
    end

    # Pagination (25 per page)
    @transactions = @transactions.page(params[:page]).per(25)

    @categories = Category.includes(:category_group).order("category_groups.name, categories.name")
  end

  def update
    @transaction = AccountTransaction.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: "Transaction updated successfully."
    else
      redirect_to transactions_path, alert: "Failed to update transaction."
    end
  end

  private

  def transaction_params
    params.require(:account_transaction).permit(:category_id)
  end
end
