require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  # Associations
  it { is_expected.to have_many(:account_transactions).dependent(:destroy) }

  # Validations
  it { is_expected.to validate_presence_of(:uuid) }

  describe "factory" do
    it "has a valid factory" do
      expect(build(:credit_card)).to be_valid
    end
  end
end
