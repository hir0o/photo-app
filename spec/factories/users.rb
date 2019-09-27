FactoryBot.define do
  factory :user do
    name { 'テストユーザー'}
    email { 'test@example.com' }
    password { 'password' }
  end
end