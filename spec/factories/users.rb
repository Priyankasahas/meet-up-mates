FactoryGirl.define do
  factory :user do
    email 'priyanka@example.com'
    password 'Password123'
    password_confirmation 'Password123'
    authentication_token 'AbCdE12345'
  end

end
