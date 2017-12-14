class PostsController < ApplicationController
  skip_before_action :authorize_request

  def index
    @posts = Post.all.to_a
    if params[:filter].present?
      @posts.keep_if { |p| p.message.present? && p.message.include?(params[:filter]) }
    end
    if params[:page].present?
      @page = Page.find_by_name!(params[:page])
      @posts.keep_if { |p| p.message.present? && p.page_id == @page.id }
    end
    if params[:category].present?
      @category = Category.find_by_name!(params[:category])
      @keywords = @category.keywords.split(',')
      @posts.keep_if { |p| p.message.present? && p.in_category?(@keywords) }
    end
    json_response(@posts, :ok)
  end
end
