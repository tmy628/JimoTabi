FactoryBot.define do
  factory :spot do
    sequence(:address) { |n| "address-#{n}" }
  end
end