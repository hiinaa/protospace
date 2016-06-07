class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|

      t.timestamps null: false
    end
  end
end
