class SpotsController < ApplicationController
  before_filter :load_spot, only: [:show]
  def index
  	@spots = Spot.all
  end

  def show
  end

  private
  def load_spot
  	@spot = Spot.find(params[:id])
  end
end
