class CreateGalacticPictures < ActiveRecord::Migration[6.1]
  def change
    create_table :galactic_pictures do |t|
      t.string :date
      t.string :description
      t.string :title
      t.string :media_type
      t.string :copyright
      t.string :hdurlra
      t.string :url
      t.integer :to_like
      t.string :download

      t.timestamps
    end
  end
end
