class CategoriesController < ApplicationController
  def create
    category = Category.create!(category_params)
    response = {
        message: Message.category_created,
        name: category.name,
        alias: category.alias,
        keywords: category.keywords
    }
    json_response(response, :created)
  end

  def show
    if params[:name].present?
      @category = Category.find_by_name(params[:name])
      render json: @category
    else
      @categories = Category.all
      render json: @categories
    end

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
        message: Message.category_deleted
    }
    json_response(response)
  end

  private

  def category_params
    params.permit(:name, :alias, :keywords)
  end



end
