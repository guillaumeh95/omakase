class Activity < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true,
  validates :photo, presence: true
  validates :to_book, presence: true
  validates :website, allow_blank: true
  # 1 out of 4 is true and others false     t.boolean "family" t.boolean "couple" t.boolean "friends" t.boolean "solo"
end
