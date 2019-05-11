class Sotg < ApplicationRecord

  belongs_to :match
  belongs_to :voted_team, class_name: 'Team', foreign_key: 'voted_team_id'
  belongs_to :voting_team, class_name: 'Team', foreign_key: 'voting_team_id'

  validates :match, uniqueness: { scope: :voting_team,
    message: "It has been voted " }
  validates :sotg1, :sotg2, :sotg3, :sotg4, :sotg5, presence: true

  VOTES = [['0', '0 - scarso(*)'], ['1', '1 - non molto buno'], ['2', '2 - buono'],
  ['3', '3 - molto buono'], ['4', '4 - eccellente (*)']]
end
