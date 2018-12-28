class Match < ApplicationRecord
  scope :newest, ->{order match_date: :asc}

  enum status: {not_occur: 0, live: 1, finished: 2}
  belongs_to :team1, class_name: Team.name, foreign_key: :team_id1
  belongs_to :team2, class_name: Team.name, foreign_key: :team_id2

  delegate :name, to: :team1, prefix: true
  delegate :name, to: :team2, prefix: true
end
