class Vote < ApplicationRecord
  belongs_to :option
  belongs_to :participant
end
