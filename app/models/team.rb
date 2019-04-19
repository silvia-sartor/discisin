class Team < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :matches
end
