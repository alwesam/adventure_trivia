class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  #TODO apparently needed this to prevent access_token from being erased
  #investigate!!!
  include AbstractController::Translation 

  respond_to :json

  def authenticate_user_from_token!
    #byebug
    token = params[:token]
    if token
      authenticate_with_token(token)
    else
      authentication_error
    end
  end

  private

  def authenticate_with_token(token)
    user_id = token.split(':').first
    user    = User.where(id: user_id).first
    #byebug
    if user && Devise.secure_compare(user.access_token, token)
      #sign_in user, store: false
      #do nothing
    else
      authentication_error
    end
  end

  def authentication_error
    render json: {success: false, message: "can't sign in"}
  end

end
