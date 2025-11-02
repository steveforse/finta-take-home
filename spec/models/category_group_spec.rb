require 'rails_helper'

RSpec.describe CategoryGroup, type: :model do
  # Associations
  it { is_expected.to have_many(:categories).dependent(:destroy) }

  # Validations
  it { is_expected.to validate_presence_of(:name) }

  describe "factory" do
    it "has a valid factory" do
      expect(build(:category_group)).to be_valid
    end
  end
end
