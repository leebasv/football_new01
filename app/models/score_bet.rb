class ScoreBet < ApplicationRecord
  belongs_to :user
  belongs_to :match
  belongs_to :team
  has_many :notifications, dependent: :destroy
end
