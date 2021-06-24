FactoryBot.define do
  factory :tag do
    sequence(:tag_name) { |n| "tag_name-#{n}" }
  end
end
