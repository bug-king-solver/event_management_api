class Participant < ApplicationRecord
  belongs_to :events
  validates :name, :email, presence: true
end
