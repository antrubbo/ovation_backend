class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :event_url, :location

  belongs_to :artist
end
