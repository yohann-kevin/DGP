class ChangeColumnDate < ActiveRecord::Migration[6.1]
  def change
    change_column :galactic_pictures, :date, :datetime, unique: true
  end
end
