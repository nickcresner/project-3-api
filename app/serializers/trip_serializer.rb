class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :start_date, :end_date, :info, :image, :attendee_ids, :leg_ids, :legs
  belongs_to :user
  has_many :attendees
  has_many :comments
  has_many :legs
end
