class Activity < ApplicationRecord
  #Associations
  has_many :visits
  has_many :trips, through: :visits

  #Validations
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true,
  validates :photo, presence: true
  validates :to_book, presence: true
  validates :website, allow_blank: true
  # 1 out of 4 is true and others false "family" "couple", "friends", "solo"
end
