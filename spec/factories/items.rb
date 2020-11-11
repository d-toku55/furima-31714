FactoryBot.define do
  factory :item do
    title              { 'あああ' }
    text               { 'あああ' }
    price              { 3000 }
    status_id          { 2 }
    category_id        { 2 }
    delivery_area_id   { 2 }
    delivery_days_id   { 2 }
    delivery_burden_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
