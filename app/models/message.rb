class Message < ApplicationRecord
  belongs_to :participant
  belongs_to :plan
  has_many :participants
end
