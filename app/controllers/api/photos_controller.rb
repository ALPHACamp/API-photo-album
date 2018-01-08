class Api::PhotosController < Api::ApplicationController
  before_action :set_photo, :only => [:show, :update, :destroy]

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
    else
      render json: {
        errors: @photo.errors
      }
    end
  end

  def update
    if @photo.update(photo_params)
      respond_to do |format|
        format.json { render json: @photo }
      end
    else
      render json:{
        errors: @photo.errors
      }
    end
  end

  def destroy
    if @photo.destroy
      render json:{
        message: "success to delete! "
      }
    else
      render json: {
        message: "Can't delete!"
      }
    end
  end

  def all
    month  =  params[:month].to_i
    url = params[:only]
    @photos = Photo.where("cast(strftime('%m', date) as int) = ?", month)
    if url
      return render json: {
        file_location: @photos.map{|photo|  photo.file_location}
      }

    else
      return respond_to do |format|
        format.json { render json: @photos }
      end
    end
  end



  private

  def photo_params
    params.permit(:title, :date, :description, :file_location)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end


end
