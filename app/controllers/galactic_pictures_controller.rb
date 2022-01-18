class GalacticPicturesController < ApplicationController
  skip_before_action :authorized, only: %i[index nasa_call find_all_nasa_picture
                                           find_most_liked find_most_download show create update update_download update_like]
  before_action :set_galactic_picture, only: %i[show update update_like update_download destroy]

  # GET /galactic_pictures
  def index
    @galactic_pictures = GalacticPicture.all.order("date DESC")

    render json: @galactic_pictures
  end

  def nasa_call
    response = JSON.parse(RestClient.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"))
    @galactic_picture = GalacticPicture.register_nasa_picture(response)
    @galactic_picture.id = SecureRandom.uuid

    if @galactic_picture.save
      render json: @galactic_picture, status: :created, location: @galactic_picture
    else
      render json: @galactic_picture.errors, status: :unprocessable_entity
    end
  end

  def find_all_nasa_picture
    final_response = []
    response = JSON.parse(RestClient.get("https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}&start_date=2021-01-01"))

    response.each do |picture|
      galactic_picture = GalacticPicture.register_nasa_picture(picture)
      galactic_picture.id = SecureRandom.uuid
      final_response << galactic_picture if galactic_picture.save
    end

    render json: final_response
  end

  def find_most_liked
    @galactic_pictures = GalacticPicture.all.order("to_like DESC").limit(8)

    render json: @galactic_pictures
  end

  def find_most_download
    @galactic_pictures = GalacticPicture.all.order("download DESC").limit(8)

    render json: @galactic_pictures
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

  def update_like
    !@galactic_picture.nil? ? @galactic_picture.to_like += 1 : @galactic_picture.to_like = 1

    if @galactic_picture.save
      render json: @galactic_picture
    else
      render json: @galactic_picture.errors, status: :unprocessable_entity
    end
  end

  def update_download
    !@galactic_picture.nil? ? @galactic_picture.download += 1 : @galactic_picture.download = 1

    if @galactic_picture.save
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
