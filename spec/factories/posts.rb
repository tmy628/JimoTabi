FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpg')) }
    title { Faker::Lorem.characters(number: 10) }
    caption { Faker::Lorem.characters(number: 30) }
    tag_name {'ほげ'}
    address { 'ほげ県ほげ市ほげ丁目123-456' }
  end
end