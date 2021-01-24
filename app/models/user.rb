class User < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :events, through: :users
end
