class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :uploads
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def user_avatar user
  if user.image.present?
    image_tag user.image_url :thumbnail
  else
    # Assuming you have a default.jpg in your assets folder
    image_tag 'default.jpg'
  end
end

end
