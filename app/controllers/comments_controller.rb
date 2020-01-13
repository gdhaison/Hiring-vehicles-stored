class CommentsController < ApplicationController
  before_action :find_commentable, only: :create

  def new
    @comment = Comment.find_by id: params[:comment_id]
    @reply = Comment.new
  end

  def create
    if params[:vehicle_id]
      @vehicle = @commentable
    elsif params[:comment_id]
      @vehicle = @commentable.commentable
    end
    @commentable.comments.build comment_params
    if @commentable.save
      respond_to do |format|
        if params[:vehicle_id]
          format.html {redirect_to @commentable}
          format.js
        elsif params[:comment_id]
          format.html {redirect_to @commentable.commentable}
          format.js
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find_by id: params[:comment_id]
    elsif params[:vehicle_id]
      @commentable = Vehicle.find_by id: params[:vehicle_id]
    end
  end
end
