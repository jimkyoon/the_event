class SessionsController < ApplicationController

  # load main page
  def index
  end

  # load login/registration page
  def loginreg
  end

  # perform login process
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/events/#{user.id}"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to :back
    end
  end

  # log them out
  def logout
    reset_session
    redirect_to "/"
  end

  # parameters from login form
  private
    def login_params
      params.require(:user).permit(:email, :password)
    end
end
