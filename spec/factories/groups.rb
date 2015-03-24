FactoryGirl.define do
  factory :group do
    name 'Group 1'
  end

  trait :with_events do
    after :create do |group|
      FactoryGirl.create_list :event, 3, :group => group
    end
  end
end
