class VotesController < ApplicationController

  def create
    @vote = Vote.new(user: current_user, comment_id: params[:comment_id])
    @vote.save
    redirect_to spot_path(Spot.find(params[:spot_id]))
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to spot_path(Spot.find(params[:spot_id]))
  end

end