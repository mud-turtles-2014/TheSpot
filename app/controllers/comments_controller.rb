class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.assign_attributes(user: current_user, spot_id: params[:spot_id])
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

  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to spots_path
  end

  def edit
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
  end
  
  def update
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to spot_path(@spot)
    else
      redirect_to edit_spot_comment_path(@spot, @comment)
    end
  end
  
  private

  def comment_params
  	params.require(:comment).permit([:body])
  end
end
