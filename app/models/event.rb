class Event < ApplicationRecord
  belongs_to :user
  has_many :matches, :dependent => :destroy
  has_many :teams, :dependent => :destroy
  has_many :favorites, :dependent => :destroy

end
