class Activity < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  #Associations
  has_many :visits
  has_many :trips, through: :visits

  #Validations
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :photo, presence: true
  validates :to_book, inclusion: { in: [ true, false ] }
  # 1 out of 4 is true and others false "family" "couple", "friends", "solo"
end
