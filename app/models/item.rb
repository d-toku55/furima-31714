class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  belongs_to :user
  has_one :record
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
    validates :status_id,          numericality: { other_than: 1 }
    validates :category_id,        numericality: { other_than: 1 }
    validates :delivery_area_id,   numericality: { other_than: 1 }
    validates :delivery_days_id,   numericality: { other_than: 1 }
    validates :delivery_burden_id, numericality: { other_than: 1 }
  end
end
