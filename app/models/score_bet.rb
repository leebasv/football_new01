class ScoreBet < ApplicationRecord
  enum status: {pending: 0, completed: 1}
  belongs_to :user
  belongs_to :match
  belongs_to :team
  has_many :notifications, dependent: :destroy
end
