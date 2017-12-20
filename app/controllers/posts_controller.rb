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
      @posts.keep_if { |p| in_category?(p, @category) }
    end
    if params[:page].present?
      if params[:limit].present?
        @posts = @posts.paginate(:page => params[:page], :per_page =>  params[:limit])
      else
        @posts = @posts.paginate(:page => params[:page], :per_page => 12)
      end
    elsif params[:limit].present?
      @posts = @posts.paginate(:page => 1, :per_page =>  params[:limit])
    end
    json_response(@posts, :ok)
  end

  def in_category?(post, category)
    result = false
    category.posts.each do |p|
      if post.fb_id == p.fb_id
        result = true
        break
      end
    end
    result
  end
end