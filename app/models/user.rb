class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         year_month_day = /\A\d{4}-\d{2}-\d{2}\z/
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana,  presence: true
  validates :birthday,  presence: true, format: { with: year_month_day }
  has_one :address
end
