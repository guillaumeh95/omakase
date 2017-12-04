class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :trips, foreign_key: :host_id
  has_many :trips, foreign_key: :tourist_id

  validates :first_name, presence: true
end
