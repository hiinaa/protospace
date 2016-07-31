class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :prototype_images, dependent: :delete_all
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :prototype_images
  validates :title, :catch_copy, :concept, presence: true

  def main_image
    prototype_images.main.first.image
  end

  def is_liked_by_current_user?(user_id)
    likes.find_by(user_id: user_id).present?
  end
end
