FactoryBot.define do

  factory :address do
    user_id               {"9"}
    postal_code           {"111-1111"}
    prefectures            {"1"}
    municipality          {"練馬区"}
    street_number         {"豊玉中"}
    building_name         {"デザイナーズキューブ"}
    last_name          {"船瀬"}
    first_name          {"光"}
    last_name_kana           {"フナセ"}
    first_name_kana           {"ヒカル"}
    user
  end
end