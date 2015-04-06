require 'pry'
class SpotsController < ApplicationController
  before_filter :load_spot, only: [:show, :edit, :update, :destroy]

  def index
  	@spots = Spot.all
    @spots = @spots.order('favorites_count desc')
    # if session[:user_id]
      @user = current_user
    # end
  end

  def show
    @can_edit = current_user == @spot.user
    @user = current_user
  end

  def new
  	@spot = Spot.new
  end

  def create
    @spot = Spot.find_by(name: params[:spot][:name])
    if @spot
      redirect_to spot_path(@spot)
    else
      call_api_create
    end
  end

  def update
  	if @spot.update(spot_params)
  	  redirect_to spot_path(@spot)
  	else
  	  redirect_to edit_spot_path(@spot)
  	end
  end

  def edit
  end

  def destroy
  	@spot.destroy
  	redirect_to spots_path
  end

  def search
    # raise params.inspect
    @spot = Spot.find_by(name: params[:q])
    if @spot
      redirect_to spot_path(@spot)
    else
      call_api_search
    end
  end

  private

  def spot_params
  	params.require(:spot).permit([:name, :address, :phone, :website, :price, :photo])

  end

  def load_spot
  	@spot = Spot.find(params[:id])
  end
end
