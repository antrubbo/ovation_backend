class User < ApplicationRecord
    has_secure_password
    has_many :tickets, dependent: :destroy
    has_many :events, through: :tickets

    validates :name, :email, presence: true
    validates :email, uniqueness:
        {message: 'An account associated with %{value} already exists'}
        
end
