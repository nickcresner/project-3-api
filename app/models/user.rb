class User < ApplicationRecord
  has_and_belongs_to_many :trips_attending, class_name: "Trip", join_table: "trips_users"
  has_many :trips_created, class_name: "Trip", foreign_key: "user_id"

  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
end
