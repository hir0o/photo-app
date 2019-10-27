# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




1.upto(10) do |n|
  User.create!(name: "#{n}名前",
               email: "email#{n}@example.com",
               image: open("#{Rails.root}/app/aseets/images/top.jpg")
              )
end

1.upto(10) do |n|
  Post.create!(
    title: "タイトル"
    

  )
end
