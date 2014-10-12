class SpotsController < ApplicationController
  before_filter :load_spot, only: [:show, :edit, :update, :destroy]

  def index
  	@spots = Spot.all
    @user = User.find(session[:id])
  end

  def show
  end

  def new
  	@spot = Spot.new
  end

  def create
  	@spot = Spot.new(spot_params)
  	if @spot.save
  		redirect_to spot_path(@spot)
  	  else
  	    redirect_to new_spot_path
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

  private

  def spot_params
  	params.require(:spot).permit([:name, :address, :phone, :website, :price, :photo])

  end

  def load_spot
  	@spot = Spot.find(params[:id])
  end
end
