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

users = User.order(:created_at).take(10)

users.each.with_index(1) do |user, n|
  user.profile_image = open("#{Rails.root}/db/sample/profile/profile-#{n}.jpg")
  user.save
end

