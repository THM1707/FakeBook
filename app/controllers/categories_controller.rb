class CategoriesController < ApplicationController
  skip_before_action :authorize_request, only: :index
  before_action :authenticate_admin, except: :index
  def create
    Category.create!(category_params)
    json_response({ message: Message.category_created }, :created)
  end

  def index
    if params[:name].present?
      @category = Category.find_by_name!(params[:name])
      response = @category.as_json
      response['keywords'] = response['keywords'].split(',')
    else
      @categories = Category.all
      response = []
      @categories.each do |c|
        temp = c.as_json
        temp['keywords'] = temp['keywords'].split(',')
        response << temp
      end
    end
    json_response(response, :ok)
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes!(category_params)
    json_response({ message: Message.category_updated }, :ok)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    json_response({ message: Message.category_deleted }, :ok)
  end

  private

  def authenticate_admin
    raise(ExceptionHandler::AuthenticationError, Message.not_admin) unless @current_user.admin?
  end

  def category_params
    params.permit(:name, :alias, :keywords)
  end

end
