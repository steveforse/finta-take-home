require 'rails_helper'

RSpec.describe SyncAllTransactionsJob, type: :job do
  describe "#perform" do
    it "calls SyncAllTransactions" do
      expect(SyncAllTransactions).to receive(:run!)
      described_class.new.perform
    end

    it "is enqueued to the default queue" do
      expect(described_class.new.queue_name).to eq("default")
    end
  end
end
