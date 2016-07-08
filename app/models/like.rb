class Like < ActiveRecord::Base
  bolongs_to :prototype, counter_cache: :likes_count
  belongs_to :user
end
