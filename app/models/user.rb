class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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
  validates :phone, presence: true, format: { with: phone_number }

  has_one :address,dependent: :destroy
  has_one :card,dependent: :destroy
  has_many :items
  has_many :sns_credentials, dependent: :destroy

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          password: Devise.friendly_token.first(7)
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns }
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    if user.blank?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token.first(7)
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns }
  end
end
