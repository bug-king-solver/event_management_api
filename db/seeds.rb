# db/seeds.rb
require 'factory_bot_rails'
require 'faker'

include FactoryBot::Syntax::Methods

# Clear existing data
Participant.delete_all
Event.delete_all

# Create diverse events
10.times do
  create(:event, capacity: rand(50..300))
end

# Create diverse participants
50.times do
  event = Event.order('RAND()').first
  create(:participant, event: event)
end
