class PhotosController < ApplicationController
      
  def index
      @photos = Photo.all
  end

  def show
      @photo = Photo.find(params[:id])
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
      @photo = Photo.find(params[:id])
  end

  def update
      @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      flash[:success] = 'photo は正常に更新されました'
      redirect_to @photo
    else
      flash.now[:danger] = 'photo は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    flash[:success] = 'photo は正常に削除されました'
    redirect_to root_url
  end
  
  private

  # Strong Parameter
  def photo_params
    params.require(:photo).permit(:caption, :embended_html)
  end
  
    
end
