class Trip < ApplicationRecord

  #Associations
  belongs_to :host, class_name: 'User'
  # belongs_to :tourist, class_name: 'User'
  has_many :visits, dependent: :destroy
  has_many :activities, through: :visits

  #Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :host_id, presence: true
  validates :tourist_id, presence: true
  validates :budget, inclusion: { in: [1, 2, 3, 4, 5] }, allow_blank: true
  validates :knows_the_city, inclusion: { in: [1, 2, 3, 4, 5] }, allow_blank: true
  validates :tourist_first_name, presence: true
  validates :tourist_email, presence: true

  # validates :tourist_id, uniqueness: { scope: :host_id } # Prevent creating a trip for self

  def filters
    true_filters = []
    filters = ["sight_seeing_adventurer", "art_lover", "serial_shopper", "nature_lover", "food_addict", "sport_lover", "history_passionate", "tech_fan", "relaxed", "city_wanderer"]
    filters.each do |filter|
      if self.send(filter)
        true_filters << filter
      end
    end
  return true_filters
  end

  def selected_profiles
    %w[sight_seeing_adventurer art_lover serial_shopper nature_lover food_addict sport_lover history_passionate tech_fan relaxed city_wanderer].select! {|profile| send(profile) == true }
  end
end
