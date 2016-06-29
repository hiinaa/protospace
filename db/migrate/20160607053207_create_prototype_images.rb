class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.integer :status, default: 0, null: false, limit: 1
      t.references :prototype, index: true, foreign_key: true
      t.timestamps
    end
  end
end

