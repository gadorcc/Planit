class Plan < ApplicationRecord
  has_many :polls
  has_many :participants
  has_many :activities
  validates :title, presence: true
  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
