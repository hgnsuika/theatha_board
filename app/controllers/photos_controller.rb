class PhotosController < ApplicationController
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
      @photo = Photo.new(photo_params)

    if @photo.save
      flash[:success] = 'Photo が正常に投稿されました'
      redirect_to @photo
    else
      flash.now[:danger] = 'Photo が投稿されませんでした'
      render :new
    end
  end

  def edit
      
  end

  def update
      

    if @photo.update(photo_params)
      flash[:success] = 'photo は正常に更新されました'
      redirect_to @photo
    else
      flash.now[:danger] = 'photo は更新されませんでした'
      render :edit
    end
  end

  def destroy
    
    @photo.destroy

    flash[:success] = 'photo は正常に削除されました'
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
  
  


 

    
end
