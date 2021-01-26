class Artist < ApplicationRecord
    has_many :events, dependent: :destroy
    has_many :tickets, through: :events

end
