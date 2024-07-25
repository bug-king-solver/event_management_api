class Participant < ApplicationRecord
  belongs_to :event
  
  validates :name, :email, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
