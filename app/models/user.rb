class User < ApplicationRecord
    has_many :tickets, dependent: :destroy
    has_many :events, through: :users

    # validates_presence_of :name, :email
end
