class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :start_date, :end_date, :info, :image, :attendee_ids, :leg_ids, :legs, :image_src
  belongs_to :user
  has_many :attendees
  has_many :comments
  has_many :legs

  def image_src
    object.image.url
  end
end
