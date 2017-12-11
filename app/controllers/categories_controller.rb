class CategoriesController < ApplicationController
  def create
    category = Category.create!(category_params)
    response = {
        message: "Created category successfully",
        name: category.name,
        alias: category.alias,
        keywords: category.keywords
    }
    json_response(response, :created)
  end

  def show
    @categories = Category.all
    render json: @categories
  end

  def update
    @category = Category.find_by_name(params[:name])
    @category.update_attributes(category_params)
    render json: @category
  end

  def destroy
    @category = Category.find_by_name(params[:name])
    @category.destroy
    response = {
        message: "Deleted category "
    }
    json_response(response)
  end

  private

  def category_params
    params.permit(:name, :alias, :keywords)
  end



end
