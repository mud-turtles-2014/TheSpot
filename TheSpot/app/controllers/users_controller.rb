class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def user_params 
  	params.require(:user).permit([:email, :username, :password, :password_confirmation])
  end
end