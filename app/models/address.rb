class Address < ApplicationRecord

  belongs_to :record

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: less_than_or_equal_to: 11 }
  end
  
end
