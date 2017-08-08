class LegSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :lng, :leg_number
  belongs_to :trip
end
