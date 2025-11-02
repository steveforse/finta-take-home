require 'rails_helper'

RSpec.describe Category, type: :model do
  # Associations
  it { is_expected.to belong_to(:category_group) }
  it { is_expected.to have_many(:account_transactions).dependent(:nullify) }

  # Validations
  it { is_expected.to validate_presence_of(:name) }

  describe "factory" do
    it "has a valid factory" do
      expect(build(:category)).to be_valid
    end
  end
end
