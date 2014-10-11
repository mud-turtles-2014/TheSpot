class UsersController < ApplicationController

  before_filter :load_user, only: [:edit, :update, :destroy, :show]

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

  def show
  end

  def edit
  end

  def update
  	  if @user.update(user_params)
  	  	redirect_to user_path(@user)
  	  else
  	  	redirect_to edit_user_path(@user.id)
  	  end
  end

  def destroy
    @user.destroy
    redirect_to spots_path
  end

  private

  def user_params 
  	params.require(:user).permit([:email, :username, :password, :password_confirmation])
  end

  def load_user
    @user = User.find(params[:id])
  end
end