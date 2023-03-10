class Participant < ApplicationRecord
  STATUSES = %w[Pending Going NotGoing Maybe]
  belongs_to :user
  belongs_to :plan
  has_many :plans, -> { order(start_datetime: :asc) }
  has_many :users
  # validates :status, presence: true
  validates :user_id, uniqueness: { scope: :plan_id,
    message: "not the same friend" }
end

# validates :quote_requestor, inclusion: { in: Participant::STATUSES }
