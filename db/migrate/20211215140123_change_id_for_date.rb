class ChangeIdForDate < ActiveRecord::Migration[6.1]
  def change
    change_column :galactic_pictures, :id, :string, limit: 36, primary: true
  end
end
