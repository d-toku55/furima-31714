class RecordAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A0[7-9]0\d{4}\d{4}\z/ }
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end
end