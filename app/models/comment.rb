class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :trip, dependent: :destroy
end
