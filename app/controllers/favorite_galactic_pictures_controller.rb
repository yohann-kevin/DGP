class FavoriteGalacticPicturesController < ApplicationController
  before_action :set_favorite_galactic_picture, only: [:show, :update, :destroy]

  # GET /favorite_galactic_pictures
  def index
    @favorite_galactic_pictures = FavoriteGalacticPicture.all

    render json: @favorite_galactic_pictures
  end

  # GET /favorite_galactic_pictures/1
  def show
    render json: @favorite_galactic_picture
  end

  # POST /favorite_galactic_pictures
  def create
    @favorite_galactic_picture = FavoriteGalacticPicture.new(favorite_galactic_picture_params)

    if @favorite_galactic_picture.save
      render json: @favorite_galactic_picture, status: :created, location: @favorite_galactic_picture
    else
      render json: @favorite_galactic_picture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorite_galactic_pictures/1
  def update
    if @favorite_galactic_picture.update(favorite_galactic_picture_params)
      render json: @favorite_galactic_picture
    else
      render json: @favorite_galactic_picture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorite_galactic_pictures/1
  def destroy
    @favorite_galactic_picture.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_galactic_picture
      @favorite_galactic_picture = FavoriteGalacticPicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_galactic_picture_params
      params.require(:favorite_galactic_picture).permit(:galactic_picture_id, :user_id)
    end
end
