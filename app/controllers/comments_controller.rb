class CommentsController < ApplicationController
  

  def new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flas[:success] = "Comment deleted!"

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
      flash[:success] = "You have created a comment!"
      redirect_to :back
    else
      flash[:alert] = "Something is wrong!"
      render 'users#show'
    end
  end

  

  def edit
  end

  private

  def comment_params
  	params.require(:comment).permit(:body)
  end

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

end
