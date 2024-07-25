class Event < ApplicationRecord
    has_many :participants
    
    validates :title, :capacity, presence: true
    validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
