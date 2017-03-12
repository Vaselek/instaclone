class CommentsController < ApplicationController
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted!"

    redirect_to :back
    # @comment = @photo.comments.find(params[:id])

    # @comment.destroy
    # flash[:success] = "Comment deleted!"
    # redirect_to :back
  end

  def create
    set_photo
   	@comment = @photo.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js {}
      end      
    else
      flash[:alert] = "Something is wrong!"
      render 'users#show'
    end

  end

  private

  def comment_params
  	params.require(:comment).permit(:body)
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

end
