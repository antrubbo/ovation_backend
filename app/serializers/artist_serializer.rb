class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :genre, :picture, :past_performances

end
