# spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:event, title: nil)).not_to be_valid
  end

  it "is invalid without a capacity" do
    expect(build(:event, capacity: nil)).not_to be_valid
  end
end
