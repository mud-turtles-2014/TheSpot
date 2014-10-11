class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to '/login'
    else
      redirect_to new_user_path
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	  if @user.update(user_params)
  	  	redirect_to user_path(@user)
  	  else
  	  	redirect_to edit_user_path(@user.id)
  	  end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to spots_path
  end

  def user_params 
  	params.require(:user).permit([:email, :username, :password, :password_confirmation])
  end
end