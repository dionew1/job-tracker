FactoryGirl.define do
  factory :comment do
    sequence(:content) { |n| "Content #{n}" }
  end
end
