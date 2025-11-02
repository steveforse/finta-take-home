require 'rails_helper'

RSpec.describe SyncController, type: :controller do
  describe "POST #create" do
    it "enqueues a SyncJob" do
      expect {
        post :create
      }.to have_enqueued_job(SyncAllTransactionsJob)
    end

    it "redirects to transactions path" do
      post :create
      expect(response).to redirect_to(transactions_path)
    end

    it "shows success notice" do
      post :create
      expect(flash[:notice]).to eq("Sync started! Transactions will be updated shortly.")
    end
  end
end
