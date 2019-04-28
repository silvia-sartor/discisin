class Category < ApplicationRecord
  belongs_to :event
  has_many :teams, :dependent => :destroy
end