class AddIndexUniqueDate < ActiveRecord::Migration[6.1]
  def change
    add_index :galactic_pictures, :date, unique: true
  end
end
