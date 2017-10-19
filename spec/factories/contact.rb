FactoryGirl.define do
  factory :contact do
    sequence(:name) { |n| "Person#{n}" }
    sequence(:position) { |n| "Position#{n}" }
    sequence(:email) { |n| "Email#{n}" }
  end
end
