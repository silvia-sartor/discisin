class Sotg < ApplicationRecord
  serialize :sotg_score, Array

  belongs_to :match
  belongs_to :voted_team, class_name: 'Team', foreign_key: 'voted_team_id'
  belongs_to :voting_team, class_name: 'Team', foreign_key: 'voting_team_id'
  has_many :matches, :dependent => :destroy

  validates :match, uniqueness: { scope: :voting_team,
    message: "It has been voted " }

  VOTES = [['0', '0 - scarso(*)'], ['1', '1 - non molto buno'], ['2', '2 - buono'],
  ['3', '3 - molto buono'], ['4', '4 - eccellente (*)']]
end
