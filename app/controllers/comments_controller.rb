class CommentsController < ApplicationController

  def create
    @comment = Comment.create(user_id: params[:user_id], spot_id: params[:spot_id], body: params[:body])
    respond_to do |format|
      format.html { redirect_to spots_path }
      format.json { render json: @comment.to_json }
    end
  end
end
