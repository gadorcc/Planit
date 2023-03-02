class Plan < ApplicationRecord
  has_many :polls
  has_many :participants
  has_many :activities
  validates :title, presence: true
  validates :location, presence: true
end
