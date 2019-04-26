class Upload < ApplicationRecord
  acts_as_taggable #:tags
  acts_as_taggable_on :skills, :interests
  has_many :comments


  mount_uploader :photoupload, PhotoUploader
  belongs_to :user
  validates_presence_of :title, :description, :photoupload
end
