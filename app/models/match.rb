class Match < ApplicationRecord
  belongs_to :event
  belongs_to :awayteam, class_name: 'Team', foreign_key: 'awayteam_id'
  belongs_to :hometeam, class_name: 'Team', foreign_key: 'hometeam_id'
end
