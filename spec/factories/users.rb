FactoryBot.define do
  factory :user1, class: User do
    name "user1"
    email "sample1@example.com"
    password 'password'
  end

  factory :user2, class: User do
    name "user2"
    email "sample2@example.com"
    password 'password'
  end
end