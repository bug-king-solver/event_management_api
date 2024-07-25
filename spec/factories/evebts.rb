FactoryBot.define do
    factory :event do
      sequence(:title) { |n| "Sample Event #{n}" }
      sequence(:description) { |n| "This is the description for event #{n}." }
      capacity { rand(50..200) }
    end
  end
  