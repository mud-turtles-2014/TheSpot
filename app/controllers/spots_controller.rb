class SpotsController < ApplicationController
  before_filter :load_spot, only: [:show, :edit, :update, :destroy]

  def index
  	@spots = Spot.all
    @spots = @spots.order(:favorites_count)
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def show
    @can_edit = current_user == @spot.user
    @user = current_user
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

  def search
    @spot = Spot.find_by(name: params[:q])
    if @spot
      redirect_to spot_path(@spot)
    else
      @spots = []
      response = Yelp.client.search('New York City', category_filter: 'breakfast_brunch', term: params[:q])
      response.businesses.each do |biz|
      @spots << Spot.create(name: biz.name, address: biz.location.display_address.join(", "), phone: biz.phone, website: biz.url, photo: biz.image_url)
      end
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
