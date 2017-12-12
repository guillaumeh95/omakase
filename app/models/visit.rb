class Visit < ApplicationRecord
  attr_accessor :destroyed
  after_destroy :mark_as_destroyed

  # Associations
  belongs_to :trip
  belongs_to :activity

  # Validations
  validates :activity, uniqueness: { scope: :trip }

  private

  def mark_as_destroyed
    self.destroyed = true
  end
end
