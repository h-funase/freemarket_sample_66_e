FactoryBot.define do
  factory :image do 
    image {File.open("#{Rails.root}/public/images/item_sample.jpg")}
    association :items
  end
end