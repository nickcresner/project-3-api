class UserSerializer < ActiveModel::Serializer
  has_many :trips_created
  has_many :trips_attending
  attributes :id, :username, :firstname, :lastname, :email, :bio, :image, :facebook_id
end
