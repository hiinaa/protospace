class RenameCachCopyColumnToPrototypes < ActiveRecord::Migration
  def change
    rename_column :prototypes, :cach_copy, :catch_copy
  end
end
