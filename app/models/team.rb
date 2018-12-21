class Team < ApplicationRecord
  belongs_to :league, optional: true
  belongs_to :stadium

  has_many :team1_match_results, class_name: MatchResult.name,
    foreign_key: :team_id1, dependent: :destroy
  has_many :team2_match_results, class_name: MatchResult.name,
    foreign_key: :team_id2, dependent: :destroy
  has_many :rankings, dependent: :destroy
  has_many :team1_matches, class_name: Match.name,
    foreign_key: :team1_id, dependent: :destroy
  has_many :team2_matches, class_name: Match.name,
    foreign_key: :team2_id, dependent: :destroy
end
