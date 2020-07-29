class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_comment, only: [:destroy]
        
  def index
    @comments = Comment.order(id: :desc).page(params[:page]).per(15)
  end
  
  def new
     @comment = Comment.new
    
  end
  
  

  def create
     @comment = Comment.new(user: current_user, photo_id: params[:photo_id], comment: params[:comment][:comment])
    if @comment.save
      flash[:success] = 'The comment has been successfully posted!'
      redirect_to root_url
    else
      flash.now[:danger] ='No comment has been post ed.'
      render :new
    end
  end 

  def destroy
    @comment.destroy

    flash[:success] = 'The comment has been successfully deleted.'
    redirect_to root_url
  end
  
end

  private

  # Strong Parameter
  

  def comment_params

    params.require(:comment).permit(:comment, :photo)
  end
 
  
  def set_comment
    @comment = Comment.find(params[:id])
  end