class Event < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :events
  has_many :favorites
end
