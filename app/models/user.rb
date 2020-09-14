class User < ApplicationRecord
  #Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatables

  # バリデーション      
       validates :nickname, :password, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, presence: true 
       validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "can't be blank"}
       validates :password, length: { with:/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/, minimum: 6 }
       validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "cannot be registered if it is empty"}
       validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "cannot be registered if it is empty"}
       validates :family_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "cannot be registered if it is empty"}
       validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "cannot be registered if it is empty"}
       validates :birth_day, format: { with: /\A[0-9]+\z/, message: "(minimum is 6 characters)"}
end
