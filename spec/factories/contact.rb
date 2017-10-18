FactoryGirl.define do
  factory :contact do
    sequence(:name) { |n| "Contact #{n}" }
    sequence(:position) { |n| "HR #{n}" }
    sequence(:email) { |n| "contact@hr.email #{n}" }
  end
end
