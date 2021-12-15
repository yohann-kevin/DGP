class GalacticPicturesController < ApplicationController
  before_action :set_galactic_picture, only: [:show, :update, :destroy]

  # GET /galactic_pictures
  def index
    @galactic_pictures = GalacticPicture.all

    render json: @galactic_pictures
  end

  def nasa_call
    response =  JSON.parse(RestClient.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"))
    @galactic_picture = GalacticPicture.register_nasa_picture(response);

    if @galactic_picture.save
      render json: @galactic_picture, status: :created, location: @galactic_picture
    else
      render json: @galactic_picture.errors, status: :unprocessable_entity
    end
  end

  def find_all_nasa_picture
    final_response = []
    response = JSON.parse(RestClient.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}" + "&start_date=2021-01-01"))

    # render json: response
    response.each do |picture|
      galactic_picture = GalacticPicture.register_nasa_picture(picture);
      final_response << galactic_picture if galactic_picture.save
    end

    render json: final_response
  end

  # GET /galactic_pictures/1
  def show
    render json: @galactic_picture
  end

  # POST /galactic_pictures
  def create
    pictures_info = JSON.parse(request.body.read)
    @galactic_picture = GalacticPicture.new(pictures_info)

    if @galactic_picture.save
      render json: @galactic_picture, status: :created, location: @galactic_picture
    else
      render json: @galactic_picture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /galactic_pictures/1
  def update
    if @galactic_picture.update(galactic_picture_params)
      render json: @galactic_picture
    else
      render json: @galactic_picture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /galactic_pictures/1
  def destroy
    @galactic_picture.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galactic_picture
      @galactic_picture = GalacticPicture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def galactic_picture_params
      params.permit(:date, :description, :title, :media_type, :copyright, :hd_surl, :url, :to_like, :download)
    end
end
