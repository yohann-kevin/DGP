class ChangeDescriptionType < ActiveRecord::Migration[6.1]
  def change
    change_column :galactic_pictures, :description, :text
  end
end
