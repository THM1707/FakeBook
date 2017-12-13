class PagesController < ApplicationController
  skip_before_action :authorize_request, only: :index
  before_action :authenticate_admin, except: :index
  def create
    Page.create!(page_params)
    json_response({ message: Message.page_created }, :created)
  end

  def index
    if params[:name].present?
      @page = Page.find_by_name!(params[:name])
      json_response(@page, :ok)
    else
      @pages = Page.all
      json_response(@pages, :ok)
    end
  end

  def update
    @page = Page.find_by_name!(params[:name])
    @page.update_attributes!(page_params)
    json_response({ message: Message.page_updated }, :ok)
  end

  def destroy
    @page = Page.find_by!(params[:url])
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
