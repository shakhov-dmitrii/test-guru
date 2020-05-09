class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:previous_page].nil? ? root_path : cookies[:previous_page]
    else
      flash.now[:alert] = 'Are you Guru? Verify your email and password please.'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
