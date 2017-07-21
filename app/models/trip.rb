class Trip < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :legs
  has_and_belongs_to_many :attendees, class_name: "User", join_table: "trips_users"
end
