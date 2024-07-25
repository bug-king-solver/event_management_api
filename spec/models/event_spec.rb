# spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  it "is invalid without a title" do
    event = build(:event, title: nil)
    expect(event).not_to be_valid
    expect(event.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a capacity" do
    event = build(:event, capacity: nil)
    expect(event).not_to be_valid
    expect(event.errors[:capacity]).to include("can't be blank")
  end

  it "is invalid with a non-integer capacity" do
    event = build(:event, capacity: "abc")
    expect(event).not_to be_valid
    expect(event.errors[:capacity]).to include("is not a number")
  end

  it "is invalid with a capacity less than or equal to zero" do
    event = build(:event, capacity: 0)
    expect(event).not_to be_valid
    expect(event.errors[:capacity]).to include("must be greater than 0")
  end
end
