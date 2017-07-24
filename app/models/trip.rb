class Trip < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :legs, dependent: :destroy
  has_and_belongs_to_many :attendees, class_name: "User", join_table: "trips_users"
  mount_uploader :image, ImageUploader
end
