class PagesController < ApplicationController
  skip_before_action :authorize_request, only: :index
  before_action :authenticate_admin, except: :index
  def create
    page = Page.create!(page_params)
    params['category'].each do |id|
      category = Category.find(id)
      page.categories << category
    end
    json_response({ message: Message.page_created }, :created)
  end

  def index
    if params[:name].present?
      @page = Page.find_by_name!(params[:name])
      response = @page.as_json
      categories_id = []
      @page.categories.each do |c|
        categories_id << c.id
      end
      response['category'] = categories_id
    else
      @pages = Page.all
      response = []
      @pages.each do |p|
        categories_id = []
        temp = p.as_json
        p.categories.each do |c|
          categories_id << c.id
        end
        temp['category'] = categories_id
        response << temp
      end
    end
    json_response(response, :ok)
  end

  def update
    page = Page.find(params[:id])
    page.update_attributes!(page_params)
    page.categories.delete_all
    params['category'].each do |id|
      category = Category.find(id)
      page.categories << category
    end
    json_response({ message: Message.page_updated }, :ok)
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    json_response({ message: Message.page_deleted }, :ok)
  end

  private

  def page_params
    params.permit(:name, :permalink_url)
  end

  def authenticate_admin
    raise(ExceptionHandler::AuthenticationError, Message.not_admin) unless @current_user.admin?
  end
end
