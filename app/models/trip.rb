class Trip < ApplicationRecord
  #Associations
  belongs_to :host, class_name: 'User'
  belongs_to :tourist, class_name: 'User'
  has_many :visits, dependent: :destroy
  has_many :activities, through: :visits

  #Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :host_id, presence: true
  validates :tourist_id, presence: true
  validates :budget, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :knows_the_city, inclusion: { in: [1, 2, 3, 4, 5] }
  # validates :tourist_id, uniqueness: { scope: :host_id } # Prevent creating a trip for self
end
