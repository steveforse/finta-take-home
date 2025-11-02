class SyncAllTransactionsJob < ApplicationJob
  queue_as :default

  def perform
    SyncAllTransactions.run!
  end
end
