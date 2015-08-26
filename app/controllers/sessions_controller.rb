class SessionsController < ApplicationController

  def create
    user = User.find_by_email params[:email]
    if user && user.valid_password?(params[:password])
      sign_in :user, user
      render json: {success: true, access_token: user.access_token}
    else
      warden.custom_failure!
      render json: {success: false}
    end
  end

end
