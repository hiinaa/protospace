class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  enum status: [:main, :sub]
  mount_uploader :image, PrototypeImageUploader
end
