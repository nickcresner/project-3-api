class LegSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :lng
  belongs_to :trip
end
