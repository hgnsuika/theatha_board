class PhotosController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create ,:show, :edit, :update, :destroy
  ]
   before_action :correct_user, only: [:update,:edit,:destroy]
   before_action :set_photo, only: [:show, :edit, :update, :destroy]
      
  def index
    @photos = Photo.order(id: :desc).page(params[:page]).per(3)
   
  end

  def show
      
  end

  def new
      @photo = Photo.new
  end

  def create
      @photo =current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = 'The photo has been successfully posted!'
      redirect_to root_url
    else
      flash.now[:danger] = 'No Photo has been posted.'
      render :new
    end
  end
  

  def edit
      
  end

  def update
      

    if @photo.update(photo_params)
      flash[:success] = 'The photo has been updated successfully.'
      redirect_to @photo
    else
      flash.now[:danger] = 'The photo has not been updated.'
      render :edit
    end
  end

  def destroy
    
    @photo.destroy

    flash[:success] = 'That photo has been successfully deleted.'
    redirect_to root_url
  end
  
  private

  # Strong Parameter
  
  def set_photo
    @photo = Photo.find(params[:id])
  end


  def photo_params
    params.require(:photo).permit(:caption, :embended_html)
  end
  
  def correct_user
    @photo = current_user.photos.find_by(id: params[:id])
    unless @photo
      redirect_to root_url
    end
  end
  


 

    
end
