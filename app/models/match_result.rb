class MatchResult < ApplicationRecord
  belongs_to :match
  belongs_to :team, class_name: Team.name, foreign_key: :team_id
end
