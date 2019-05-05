class Sotg < ApplicationRecord

  belongs_to :match
  belongs_to :voted_team, class_name: 'Team', foreign_key: 'voted_team_id'
  belongs_to :voting_team, class_name: 'Team', foreign_key: 'voting_team_id'

  validates :match, uniqueness: { scope: :voting_team,
    message: "It has been voted " }
  validates :sotg_score1, :sotg_score2, :sotg_score3, :sotg_score4, :sotg_score5, presence: true

  VOTES = [['0', '0 - scarso(*)'], ['1', '1 - non molto buno'], ['2', '2 - buono'],
  ['3', '3 - molto buono'], ['4', '4 - eccellente (*)']]
end
