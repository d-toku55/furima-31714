class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, inclusion: { in: ["@"] }

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i },
  uniqueness: true, length: { minimum: 6 }, confirmation: true
  validates :encrypted_password_confirmation, presence: true

  validates :family_name,         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }, presence: true
  validates :first_name,          format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }, presence: true
  validates :family_name_reading, format: { with: /\p{katakana}/ }, presence: true
  validates :first_name_reading,  format: { with: /\p{katakana}/ }, presence: true
  validates :nickname,                      presence: true
  validates :birthday,                      presence: true

end
