class Sotg < ApplicationRecord
  belongs_to :match
  has_many :matches, :dependent => :destroy

end
