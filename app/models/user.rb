class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :add_photo # Add the standard profile photo to new user created

  # Cloudinary + Carrierwave for User model (photo)
  mount_uploader :photo, PhotoUploader

  # Associations
  has_many :trips, foreign_key: :host_id, dependent: :destroy
  has_many :trips, foreign_key: :tourist_id

  # Validations
  validates :first_name, presence: true

  private

  # Add Photo to new user
  def add_photo
    user = self
    user.remote_photo_url = "http://res.cloudinary.com/dna8puisr/image/upload/v1512743339/default_avatar_qa3u1k.png"
    user.save
  end
end
