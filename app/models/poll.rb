class Poll < ApplicationRecord
  belongs_to :plan
  has_many :options
  validates :question, presence: true
  validates :option, length: { minimum: 2 }
  STATUS = %w[Going NotGoing Maybe Pending]
  validates :status, inclusion: { in: STATUS }, presence: true
end
