FactoryBot.define do
  factory :item do
    image                    { Faker::Lorem.sentence }
    name                     { 'test' }
    info                     { Faker::Lorem.sentence }
    category_id              { 2 }
    sales_status_id          { 2 }
    shipping_free_status_id  { 2 }
    prefecture_id            { 2 }
    scheduled_delivery_id    { 2 }
    price                    { 10_000 }
    association :user
  end
end
