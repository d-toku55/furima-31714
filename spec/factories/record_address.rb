FactoryBot.define do
  factory :record_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefectures_id { '2' }
    municipality { '秋田市' }
    address { '青山1-1' }
    phone_number { '08012345678' }
  end
end
