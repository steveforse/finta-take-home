require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category_group) { create(:category_group) }

  describe "GET #index" do
    let!(:category) { create(:category, category_group: category_group) }

    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        { category: { name: "Entertainment", category_group_id: category_group.id } }
      end

      it "creates a new category" do
        expect {
          post :create, params: valid_params
        }.to change(Category, :count).by(1)
      end

      it "redirects to categories path" do
        post :create, params: valid_params
        expect(response).to redirect_to(categories_path)
      end

      it "shows success notice" do
        post :create, params: valid_params
        expect(flash[:notice]).to eq("Category created successfully.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        { category: { name: "", category_group_id: category_group.id } }
      end

      it "does not create a new category" do
        expect {
          post :create, params: invalid_params
        }.not_to change(Category, :count)
      end

      it "returns unprocessable entity status" do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with duplicate category name in same group" do
      let!(:existing_category) { create(:category, name: "Meals", category_group: category_group) }
      let(:duplicate_params) do
        { category: { name: "Meals", category_group_id: category_group.id } }
      end

      it "does not create a duplicate category" do
        expect {
          post :create, params: duplicate_params
        }.not_to change(Category, :count)
      end
    end
  end
end
