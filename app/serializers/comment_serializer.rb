class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user
  has_one :user
  has_one :trip
end
