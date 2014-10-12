class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    # change user_id to grab from current user
    @comment.assign_attributes(user_id: 1, spot_id: params[:spot_id])
    if @comment.save
      redirect_to spot_path(params[:spot_id])
    end

    # respond_to do |format|
    #   format.html { redirect_to spots_path }
    #   format.json { render json: @comment.to_json }
    # end
  end

  def new
  	@spot = Spot.find(params[:spot_id])
  	@comment = Comment.new
  end

  private

  def comment_params
  	params.require(:comment).permit([:body])
  end
end
