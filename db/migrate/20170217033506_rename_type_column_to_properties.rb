class RenameTypeColumnToProperties < ActiveRecord::Migration[5.0]
  def change
    rename_column :properties, :type, :house_type
  end
end
