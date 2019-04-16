class Team < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :match
end
