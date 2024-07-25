# spec/models/participant_spec.rb
require 'rails_helper'

RSpec.describe Participant, type: :model do
  it "has a valid factory" do
    expect(build(:participant)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:participant, name: nil)).not_to be_valid
  end

  it "is invalid without an email" do
    expect(build(:participant, email: nil)).not_to be_valid
  end

  it "is associated with an event" do
    event = create(:event)
    participant = create(:participant, event: event)
    expect(participant.event).to eq(event)
  end
end
