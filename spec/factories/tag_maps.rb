FactoryBot.define do
  factory :tag_map do
    association :post
    association :tag
  end
end