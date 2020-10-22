class PhotosController < ApplicationController
  before_action :set_photo, only: :show

  def index
  end

  def new 
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Your photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def show 
    @photo
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end

  #  Only allow certain parameters through.
  def photo_params
    params.require(:photo).permit(:description, :picture)
  end
end
