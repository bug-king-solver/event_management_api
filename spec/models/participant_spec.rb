# spec/models/participant_spec.rb
require 'rails_helper'

RSpec.describe Participant, type: :model do
  it "has a valid factory" do
    expect(build(:participant)).to be_valid
  end

  it "is invalid without a name" do
    participant = build(:participant, name: nil)
    expect(participant).not_to be_valid
    expect(participant.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    participant = build(:participant, email: nil)
    expect(participant).not_to be_valid
    expect(participant.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a malformed email" do
    participant = build(:participant, email: "invalid_email")
    expect(participant).not_to be_valid
    expect(participant.errors[:email]).to include("is invalid")
  end

  it "is associated with an event" do
    event = create(:event)
    participant = create(:participant, event: event)
    expect(participant.event).to eq(event)
  end
end
