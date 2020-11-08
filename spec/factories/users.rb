FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    family_name           { 'あア阿' }
    family_name_reading   { 'カタカナ' }
    first_name            { 'あア阿' }
    first_name_reading    { 'カタカナ' }
    birthday              { 20_200_101 }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
  end
end
