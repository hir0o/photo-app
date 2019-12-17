Faker::Config.locale = :en

PICTURE_NUM = 20

1.upto(50) do |n|
  name  = Faker::TvShows::BreakingBad.character
  email = "sample3-#{n}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password
              )
end

users = User.order(:created_at).take(10)

users.each.with_index(1) do |user, n|
  p user.name
  #プロフィール画像の更新
  user.profile_image = open("#{Rails.root}/db/sample/profile/profile-#{n}.jpg")
  user.save
  # 写真の投稿
  1.upto(rand(6) + 1) do |n|
    title = Faker::Movie.quote
    description = Faker::Lorem.sentence
    pictures = [
      open("#{Rails.root}/db/sample/image/image-#{rand(PICTURE_NUM) + 1}.jpg"),
      open("#{Rails.root}/db/sample/image/image-#{rand(PICTURE_NUM) + 1}.jpg"),
      open("#{Rails.root}/db/sample/image/image-#{rand(PICTURE_NUM) + 1}.jpg")
    ]
    latitude = rand(34..52)
    longitude = rand(-117..-77)
    user.posts.create(
                  title: title,
                  description: description,
                  pictures: pictures,
                  latitude: latitude,
                  longitude: longitude
    )
  end
end