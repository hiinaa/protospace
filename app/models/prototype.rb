class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images
  accepts_nested_attributes_for :prototype_images
  validates :title, :catch_copy, :concept, presence: true
end
