class Match < ApplicationRecord
  scope :newest, ->{order match_date: :asc}

  enum status: {not_occur: 0, live: 1, finished: 2}
  belongs_to :team1, class_name: Team.name, foreign_key: :team_id1
  belongs_to :team2, class_name: Team.name, foreign_key: :team_id2

  has_one :match_result
  has_many :score_bets, foreign_key: :match_id
  delegate :name, to: :team1, prefix: true
  delegate :name, to: :team2, prefix: true
  delegate :score1, to: :match_result, prefix: true
  delegate :score2, to: :match_result, prefix: true

  validates :team_id1, presence: true
  validates :team_id2, presence: true
  validates :extra_time1, numericality: true
  validates :extra_time2, numericality: true
  validates :time, numericality: true
  validates :round_id, numericality: true

  delegate :name, to: :team1, prefix: true
  delegate :name, to: :team2, prefix: true

  def check_match_finish
    return if score_bets.nil? || match_date >= Time.now
    score_bets.each do |s|
      next unless s.outcome.to_sym == check_result.to_sym
      s.win
    end
  end

  def check_result
    if match_result_score1 < match_result_score2
      ScoreBet.outcomes.key(2)
    elsif match_result_score1 > match_result_score2
      ScoreBet.outcomes.key(0)
    else
      ScoreBet.outcomes.key(1)
    end
  end
end
