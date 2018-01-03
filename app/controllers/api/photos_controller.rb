class Api::PhotosController < Api::ApplicationController


  def index
    @photos = Photo.all
    respond_to do |format|
      format.json { render json: @photos }
    end
  end




end
