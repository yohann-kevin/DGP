class RenameColumnHdurl < ActiveRecord::Migration[6.1]
  def change
    rename_column :galactic_pictures, :hdurl, :hd_url
  end
end
