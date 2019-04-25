class Upload < ApplicationRecord
  mount_uploader :photoupload, PhotoUploader
  belongs_to :user
  validates_presence_of :title, :description,  :photoupload
end
