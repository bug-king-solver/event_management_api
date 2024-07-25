class Event < ApplicationRecord
    has_many :participants
    validates :title, :capacity, presence: true
end
