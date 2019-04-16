class Match < ApplicationRecord
  belongs_to :event
  has_many :teamss
end
