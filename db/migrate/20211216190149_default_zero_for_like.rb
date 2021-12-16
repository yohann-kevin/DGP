class DefaultZeroForLike < ActiveRecord::Migration[6.1]
  def change
    change_column :galactic_pictures, :to_like, :integer, :default => 0
    change_column :galactic_pictures, :download, :integer, :default => 0
  end
end
