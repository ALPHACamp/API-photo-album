class Api::PhotosController < Api::ApplicationController


  def index
    @photos = Photo.all
    respond_to do |format|
      format.json { render json: @photos }
    end
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      render json: {
        message: "success create pohoto!!"
      }
    end
  end



  private

  def photo_params
    params.permit(:title, :date, :description, :file_location)
  end



end
