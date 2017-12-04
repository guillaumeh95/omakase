class Trip < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :tourist, class_name: 'User'
end
