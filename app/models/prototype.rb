class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :prototype_images, dependent: :delete_all
  accepts_nested_attributes_for :prototype_images
  validates :title, :catch_copy, :concept, presence: true

  def main_image
    prototype_images.main.first.image
  end
end
