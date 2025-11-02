require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let!(:bank_account) { create(:bank_account) }
  let!(:credit_card) { create(:credit_card) }
  let!(:category) { create(:category) }
  let!(:bank_transaction) { create(:account_transaction, account: bank_account) }
  let!(:credit_transaction) { create(:account_transaction, :credit_card, account: credit_card) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    let(:transaction) { create(:account_transaction) }

    it "updates the transaction category" do
      patch :update, params: { id: transaction.id, account_transaction: { category_id: category.id } }
      transaction.reload
      expect(transaction.category).to eq(category)
    end

    it "redirects to transactions path" do
      patch :update, params: { id: transaction.id, account_transaction: { category_id: category.id } }
      expect(response).to redirect_to(transactions_path)
    end

    it "shows success notice" do
      patch :update, params: { id: transaction.id, account_transaction: { category_id: category.id } }
      expect(flash[:notice]).to eq("Transaction updated successfully.")
    end
  end
end
