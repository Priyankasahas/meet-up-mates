FactoryGirl.define do
  factory :event do
    name Forgery(:lorem_ipsum).words(2)
    details Forgery(:lorem_ipsum).words(5)
    date_and_time DateTime.now + 1.day

  end

end
