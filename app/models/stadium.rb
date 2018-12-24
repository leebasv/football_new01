class Stadium < ApplicationRecord
  has_many :teams, dependent: :destroy
end
