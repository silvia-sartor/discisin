class Team < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :matches
  has_many :members, :dependent => :destroy
end
