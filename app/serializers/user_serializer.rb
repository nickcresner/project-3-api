class UserSerializer < ActiveModel::Serializer
  has_many :trips_created
  has_many :trips_attending
  attributes :id, :username, :firstname, :lastname, :email, :bio, :facebook_id, :image_src

  def image_src
    object.image.url
  end
end
