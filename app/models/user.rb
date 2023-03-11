class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ...Avatar Attachment...
  has_one_attached :avatar_picture

  # Validations
  validates :avatar_picture, file_size: { less_than_or_equal_to: 5.megabytes },
  file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }
end
