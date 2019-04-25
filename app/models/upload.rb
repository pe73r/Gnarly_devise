class Upload < ApplicationRecord
  mount_uploader :photoupload, PhotoUploader
  belongs_to :user
  validates_presence_of :title, :description
  validates_acceptance_of :photoupload, presence: true,
  attachment_content_type: {content_type: ["application/pdf", "application/doc", "image/jpg", "image/png","image/jpeg"] }
end
