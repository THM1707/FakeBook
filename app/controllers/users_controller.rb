class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.name, user.password).call
    response = {
        message: Message.account_created,
        user: user,
        token: auth_token
    }
    json_response(response, :created)
  end

  def save
    @save = Save.create!(user_id: @current_user.id, permalink_url: params[:post])
    json_response({message: Message.saved}, :ok)
  end


  def unsave
    @save = Save.find_by_permalink_url!(params[:post])
    @save.destroy
    json_response({message: Message.unsaved}, :ok)
  end

  def show_saved_posts
    @urls = @current_user.saves.pluck(:permalink_url)
    @posts = []
    @urls.each do |u|
      @post = Post.select('permalink_url').find_by_permalink_url(u).as_json(except: :id)
      @posts << @post
    end
    if params[:page].present?
      @render_posts = @posts.paginate(page: params[:page], per_page: 1)
      json_response(@render_posts, :ok)
    else
      json_response(@posts, :ok)
    end
  end

  def show_saved_posts_url
    @urls = @current_user.saves.pluck(:permalink_url)
    json_response(@urls, :ok)
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
