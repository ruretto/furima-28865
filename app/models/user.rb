class User < ApplicationRecord
       devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatables
     
       # バリデーション
       VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
       validates :password, presence: true, length: { minimum: 6 },
                 format: { with: VALID_PASSWORD_REGEX }
       NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
       NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
       validates :nickname, presence: true
       validates :password_confirmation, presence: true,  length: { minimum: 6 },format: { with: VALID_PASSWORD_REGEX }
       validates :family_name, presence: true, format: {with: NAME_REGEX } 
       validates :first_name, presence: true, format: {with: NAME_REGEX } 
       validates :family_name_kana, presence: true, format: {with: NAME_KANA_REGEX }
       validates :first_name_kana, presence: true, format: {with: NAME_KANA_REGEX }
       validates :birth_day, presence: true
end