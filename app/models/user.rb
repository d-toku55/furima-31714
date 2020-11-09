class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  NAME_READING_REGEX = /\p{katakana}/

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :encrypted_password, presence: true
  validates :family_name,         format: { with: NAME_REGEX }, presence: true
  validates :first_name,          format: { with: NAME_REGEX }, presence: true
  validates :family_name_reading, format: { with: NAME_READING_REGEX }, presence: true
  validates :first_name_reading,  format: { with: NAME_READING_REGEX }, presence: true
  validates :nickname,                      presence: true
  validates :birthday,                      presence: true
end
