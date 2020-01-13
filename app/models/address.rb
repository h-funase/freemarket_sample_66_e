class Address < ApplicationRecord
  belongs_to  :user, optional: true
  validates :postal_code, :prefectures, :municipality, :street_number, presence: true
end
