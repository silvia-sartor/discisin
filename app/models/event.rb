class Event < ApplicationRecord
  belongs_to :user
  has_many :categories, :dependent => :destroy
  has_many :teams, through: :categories
  has_many :favorites, :dependent => :destroy
end
