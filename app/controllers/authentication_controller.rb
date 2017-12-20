class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  skip_before_action :authorize_request, only: :authenticate

  def authenticate
    auth = AuthenticateUser.new(auth_params[:name], auth_params[:password])
    token = auth.call
    user = response_user(auth.user_id)
    response = {
        message: Message.login_success,
        user: user,
        token: token,
        remember: auth_params[:remember]
    }
    json_response(response)
  end

  private

  def response_user(id)
    User.find(id)
    # user = User.find(id)
    # {
    #     id: id,
    #     name: user.name,
    #     avata: user.avatar,
    #     active: user.active,
    #     admin: user.admin,
    #     created_at: user.created_at,
    #     update_at: user.updated_at
    # }
  end

  def auth_params
    params.permit(:name, :password, :remember)
  end
end
