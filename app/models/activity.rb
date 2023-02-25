class Activity < ApplicationRecord
  belongs_to :plan
  validates :title, presence: true
  validates :location, presence: true
end
