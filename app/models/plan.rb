class Plan < ApplicationRecord
  has_many :polls, :participant, :activities
  validates :title, presence: true
  validates :location, presence: true
end
