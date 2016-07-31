class AddLikeCountToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :likes_count, :integer, default: 0
    add_column :prototypes, :comments_count, :integer
  end
end
