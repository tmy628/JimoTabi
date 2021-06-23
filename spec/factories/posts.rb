FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpg')) }
    title { Faker::Lorem.characters(number: 10) }
    caption { Faker::Lorem.characters(number: 30) }

    # TagMapモデルのテスト時OFF
    association :spot, factory: :spot

    after(:create) do |post|
      create_list(:tag_map, 1, post: post, tag: create(:tag))
    end
  end
end