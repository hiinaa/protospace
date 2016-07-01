class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images
  accepts_nested_attributes_for :prototype_images, reject_if: proc { |attributes| attributes['image'].blank? }
  validates :title, :catch_copy, :concept, presence: true

  def main_image
    prototype_images.main.first.image
  end
end
