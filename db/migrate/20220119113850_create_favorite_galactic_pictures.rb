class CreateFavoriteGalacticPictures < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_galactic_pictures do |t|
      t.string :galactic_picture_id
      t.string :user_id

      t.timestamps
    end
  end
end
