class Visit < ApplicationRecord
  #Associations
  belongs_to :trip
  belongs_to :activity

  #Validations
  validates :activity, uniqueness: { scope: :trip }
end
