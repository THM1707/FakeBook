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

  def like
    @post = Post.find_by_permalink_url!(params[:post])
    like = Like.create!(user_id: @current_user.id, post_id: @post.id)
    json_response({ message: Message.liked }, :ok)
  end


  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end

end
