class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :plans
  has_many :users
end
