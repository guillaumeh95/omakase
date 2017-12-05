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
  validates :budget, inclusion: { in: [1, 2, 3, 4, 5] }, allow_blank: true
  validates :knows_the_city, inclusion: { in: [1, 2, 3, 4, 5] }, allow_blank: true
end
