class New < ApplicationRecord
  has_many :comments, dependent: :destroy
end
