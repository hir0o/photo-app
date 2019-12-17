Faker::Config.locale = :en

1.upto(99) do |n|
  name  = Faker::TvShows::BreakingBad.character
  email = "sample-#{n}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
  end
