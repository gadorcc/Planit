class Vote < ApplicationRecord
  belongs_to :option, :participant
end
