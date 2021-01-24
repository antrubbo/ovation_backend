class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time

  belongs_to :artist
end
