class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  enum status: { main: 0, sub: 1 }
  mount_uploader :name, PrototypeImageUploader
end
