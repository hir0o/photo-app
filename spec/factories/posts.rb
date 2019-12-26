FactoryBot.define do
  factory :post, class: Post do
    title { 'タイトル' }
    pictures do
      [
        open("#{Rails.root}/db/sample/image/image-1.jpg"),
        open("#{Rails.root}/db/sample/image/image-2.jpg"),
        open("#{Rails.root}/db/sample/image/image-3.jpg")
      ]
    end
    latitude { 0 }
    longitude { 0 }
    user
    trait :invalid do
      title nil
    end
  end
end
