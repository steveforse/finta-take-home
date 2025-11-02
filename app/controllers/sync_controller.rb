class SyncController < ApplicationController
  def create
    # Trigger sync job
    SyncAllTransactionsJob.perform_later

    redirect_to transactions_path, notice: "Sync started! Transactions will be updated shortly."
  end
end
