class GalacticPicture < ApplicationRecord
  validates :date, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :media_type, presence: true
  validates :copyright, presence: true
  validates :hdurl, presence: true
  validates :url, presence: true
end
