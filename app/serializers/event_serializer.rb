class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location

  belongs_to :artist
end
