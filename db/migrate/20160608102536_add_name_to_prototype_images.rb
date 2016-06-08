class AddNameToPrototypeImages < ActiveRecord::Migration
  def change
    add_column :prototype_images, :name, :integer
  end
end
