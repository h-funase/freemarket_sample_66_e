class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         kanji = /\A[一-龥]+\z/
         kana = /\A([ァ-ン]|ー)+\z/
         year_month_day = /\A\d{4}-\d{2}-\d{2}\z/
         VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         phone_number = /\A[0-9]+\z/

  validates :nickname, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: VALID_EMAIL }
  validates :first_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :last_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :first_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :last_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :birthday,  presence: true, format: { with: year_month_day }
  validates :password,presence: true ,length: { minimum: 6  }
  validates :phone, presence: true, format: { with: phone_number}

  has_one :address,dependent: :destroy
  has_one :card,dependent: :destroy
  has_many :items
end
