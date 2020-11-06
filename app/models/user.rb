class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, inclusion: { in: ["@"] }

  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
  uniqueness: true, length: { minimum: 6 }, confirmation: true
  validates :encrypted_password_confirmation, presence: true

  validates_format_of :family_name,         presence: true, with: /\A[ぁ-んァ-ン一-龥]+\z/
  validates_format_of :first_name,          presence: true, with: /\A[ぁ-んァ-ン一-龥]+\z/
  validates_format_of :family_name_reading, presence: true, wiih: /\p{katakana}/
  validates_format_of :first_name_reading,  presence: true, wiih: /\p{katakana}/
  validates :nickname,                      presence: true
  validates :birthday,                      presence: true

end
