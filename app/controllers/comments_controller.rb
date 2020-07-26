class CommentsController < ApplicationController
  before_action :require_user_logged_in
  
        
  def index
    @comments = Comment.order(id: :desc).page(params[:page]).per(15)
  end
  
  def new
     @comment = Comment.new
  end
  

  def create
      @comment =current_user.photos.build(photo_params)
    if @comment.save
      flash[:success] = 'The comment has been successfully posted!'
      redirect_to root_url
    else
      flash.now[:danger] ='No comment has been posted.'
      render :new
    end
  end

  def destroy
    @comment.destroy

    flash[:success] = 'The comment has been successfully deleted.'
    redirect_to root_url
  end
  
end
