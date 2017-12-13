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
    @post = Post.find_by_permalink_url!(params[:post])
    @save = Save.create!(user_id: @current_user.id, post_id: @post.id)
    json_response({ message: Message.saved }, :ok)
  end

  def unsave
    @post = Post.find_by_permalink_url!(params[:post])
    @save = Save.find_by!(user_id: @current_user.id, post_id: @post.id)
    @save.destroy
    json_response({ message: Message.unsaved }, :ok)
  end

  def show_saved_posts
    @posts = @current_user.posts
    if params[:page].present?
      @render_posts = @posts.paginate(page: params[:page], per_page: 10)
      json_response(@render_posts, :ok)
    else
      json_response(@posts, :ok)
    end
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
