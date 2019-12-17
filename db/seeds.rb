Faker::Config.locale = :en

1.upto(10) do |n|
  name  = Faker::TvShows::BreakingBad.character
  email = "sample2-#{n}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               profile_image: open("#{Rails.root}/db/sample/profile/profile-#{n}.jpg")
              )
end

