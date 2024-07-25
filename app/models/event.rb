class Event < ApplicationRecord
    has_many :participants, dependent: :destroy
    
    validates :title, :capacity, presence: true
    validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
