FactoryBot.define do
  factory :user do
    name "name"
    email "hoge@example.com"
    password 'password'
    password_confirmation 'password'
  end

  factory :user1, class: User do
    name "user1"
    email "sample1@example.com"
    password 'password'
    password_confirmation 'password'
    trait :invalid do
      name nil
    end
  end

  factory :user2, class: User do
    name "user2"
    email "sample2@example.com"
    password 'password'
    password_confirmation 'password'
  end
end
