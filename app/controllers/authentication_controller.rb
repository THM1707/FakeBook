class AuthenticationController < ApplicationController
  # return auth token once user is authenticated
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:name], auth_params[:password]).call
    json_response({message: Message.login_success ,name: auth_params[:name], auth_token: auth_token})
  end

  private

  def auth_params
    params.permit(:name, :password)
  end
end