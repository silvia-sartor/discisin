class Member < ApplicationRecord
  belongs_to :user
  belongs_to :team, :dependent => :destroy
end
