class CategoriesController < ApplicationController
  def index
    @category_groups = CategoryGroup.includes(:categories).order(:name)
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: "Category created successfully."
    else
      @category_groups = CategoryGroup.includes(:categories).order(:name)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :category_group_id)
  end
end
