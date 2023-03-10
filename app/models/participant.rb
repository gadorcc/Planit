class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :plans
  has_many :users
  validates :user_id, uniqueness: { scope: :plan_id,
    message: "not the same friend" }
end
