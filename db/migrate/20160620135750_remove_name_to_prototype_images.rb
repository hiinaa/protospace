class RemoveNameToPrototypeImages < ActiveRecord::Migration
  def change
    remove_column :prototype_images, :name, :integer
  end
end
