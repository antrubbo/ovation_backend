class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :genre, :past_performances

end
