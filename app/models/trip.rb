class Trip < ApplicationRecord
  # Define variables associating key and value
  BUDGET = { 1 => "Poor", 2 => "Average", 3 => "Not Sure", 4 => "Rich", 5 => "Very Rich" }
  KNOWS_THE_CITY = { 1 => "Not At All", 2 => "Little", 3 => "Not Sure", 4 => "Good", 5 => "Well" }

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
  # def filters
  #   true_filters = []
  #   profiles = %w[sight_seeing_adventurer art_lover serial_shopper nature_lover food_addict sport_lover history_passionate tech_fan relaxed city_wanderer]
  #   profiles.each do |profile|
  #     if self.send(profile)
  #       true_filters << profile
  #     end
  #   end
  #   return true_filters
  # end

  def filters
    # Call model column on self (metadata since element in array is a string, not a variable hence we use send) <=> self.send(profile) == true
    %w[sight_seeing_adventurer art_lover serial_shopper nature_lover food_addict sport_lover history_passionate tech_fan relaxed city_wanderer].select! {|profile| send(profile) == true }
  end
end
