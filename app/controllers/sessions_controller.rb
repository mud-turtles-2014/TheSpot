class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: sessions_params[:username])
    .try(:authenticate, sessions_params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to spots_path
    else
      flash[:login] = "Invalid Credentials"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to spots_path
  end

  private

  def sessions_params
    params.require(:session).permit(:username, :password)
  end
end
