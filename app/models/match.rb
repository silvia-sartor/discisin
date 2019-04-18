class Match < ApplicationRecord
  belongs_to :event
  has_many :points, :dependent => :destroy
end
