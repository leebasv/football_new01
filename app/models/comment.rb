class Comment < ApplicationRecord
  belongs_to :new
  belongs_to :user
end
