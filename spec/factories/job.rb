FactoryGirl.define do
  factory :job do
    sequence(:title) { |n| "Job#{n}" }
    sequence(:level_of_interest) { |n| "Interest#{n}" }
    sequence(:city) { |n| "City#{n}" }
    sequence(:description) { |n| "Description#{n}" }
  end
end
