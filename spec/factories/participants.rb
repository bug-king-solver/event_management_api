FactoryBot.define do
    factory :participant do
      sequence(:name) { |n| "Participant #{n}" }
      sequence(:email) { |n| "participant#{n}@example.com" }
      association :event
    end
  end
  