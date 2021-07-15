FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    caption { Faker::Lorem.characters(number: 30) }
    prefecture_name { '東京' }

    # TagMapモデルのテスト時OFF
    association :spot, factory: :spot

    after(:create) do |post|
      create_list(:tag_map, 1, post: post, tag: create(:tag))
    end
  end
end
