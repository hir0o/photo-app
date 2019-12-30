Faker::Config.locale = :en
PICTURE_NUM = 20

1.upto(19) do |n|
  name  = Faker::TvShows::BreakingBad.character
  email = "sample-#{n}@example.com"
  profile_image = open("#{Rails.root}/db/sample/profile/profile-#{n}.jpg")
  password = "password"
  User.create!(name: name,
               email: email,
               profile_image: profile_image,
               password: password,
               password_confirmation: password)
end

# サンプルユーザー
sampe = User.create!(
  name: "サンプル",
  email: "sample@example.com",
  password: "password",
  password_confirmation: "password"
)

users = User.order(created_at: "DESC").take(19).push(sampe)

users.each.with_index(1) do |user, n|
  1.upto(6) do |n|
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

# リレーションシップ
user = users.last
following = users[2..20]
followers = users[3..10]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }

# # いいね
posts = Post.order(:created_at)

0.upto(30) do |i|
  0.upto(10) do |n|
    posts[i].likes.create(user_id: users[n].id)
  end
end

# 回覧履歴
0.upto(30) do |i|
  0.upto(10) do |n|
    posts[i].footprints.create(user_id: users[n].id)
  end
end

# コメント
0.upto(30) do |i|
  0.upto(10) do |n|
    content = Faker::Lorem.sentence
    users[n].comments.create(post_id: posts[i].id, content: content)
  end
end
