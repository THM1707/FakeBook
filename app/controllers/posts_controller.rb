class PostsController < ApplicationController
  skip_before_action :authorize_request

  def index
    @posts = Post.all.to_a
    if params[:filter].present?
      @posts.keep_if { |p| p.message.present? && p.message.include?(params[:filter]) }
    end
    if params[:shop].present?
      @page = Page.find_by!(permalink_url: params[:shop])
      @posts.keep_if { |p| p.message.present? && p.page_id == @page.id }
    end
    if params[:category].present?
      @category = Category.find_by_name!(params[:category])
      @keywords = @category.keywords.split(',')
      @posts.keep_if { |p| p.message.present? && p.in_category?(@keywords) }
    end
    if params[:page].present? then
      if params[:limit].present? then
        @posts = @posts.paginate(:page => params[:page], :per_page =>  params[:limit])
      else
        @posts = @posts.paginate(:page => params[:page], :per_page => 12)
      end
    elsif params[:limit].present?
      @posts = @posts.paginate(:page => 1, :per_page =>  params[:limit])
    end
    json_response(@posts, :ok)
  end
end
