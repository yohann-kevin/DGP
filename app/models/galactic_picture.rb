class GalacticPicture < ApplicationRecord
  validates :date, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :media_type, presence: true
  validates :copyright, presence: true
  validates :url, presence: true

  def self.register_nasa_picture(nasa_picture)
    nasa_picture[:description] = nasa_picture.delete("explanation")
    nasa_picture[:hd_url] = nasa_picture.delete("hdurl")
    nasa_picture.delete("service_version")
    nasa_picture["copyright"] = "Provided by NASA" if nasa_picture["copyright"].nil?
    nasa_picture["date"] = nasa_picture["date"].to_time
    @galactic_picture = GalacticPicture.new(nasa_picture)
  end
end
