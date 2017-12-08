class Trip < ApplicationRecord
  # Associations
  belongs_to :host, class_name: 'User'
  has_many :visits, dependent: :destroy
  has_many :activities, through: :visits

  # Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :host_id, presence: true
  validates :tourist_id, presence: true
  validates :status, presence: true
  validates :budget, inclusion: { in: [1, 2, 3, 4, 5] }, allow_blank: true
  validates :knows_the_city, inclusion: { in: [1, 2, 3, 4, 5] }, allow_blank: true
  validates :tourist_first_name, presence: true
  validates :tourist_email, presence: true

  # Select profiles of a trip
  def filters
    filters = %w(sight_seeing_adventurer art_lover serial_shopper nature_lover food_addict sport_lover history_passionate tech_fan relaxed city_wanderer)
    return filters.select { |filter| self.send(filter) }
  end

  # Select profiles of a trip
  def selected_profiles
    # Call model column on self (metadata since element in array is a string, not a variable hence we use send) <=> self.send(profile) == true
    %w[sight_seeing_adventurer art_lover serial_shopper nature_lover food_addict sport_lover history_passionate tech_fan relaxed city_wanderer].select! {|profile| send(profile) == true }
  end
end
