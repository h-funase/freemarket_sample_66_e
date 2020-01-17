FactoryBot.define do

  factory :item do
    user_id               {1}
    name                  {"マジでムズイマン"}
    description           {"説明など不要であろう"}
    category_id           {2}
    size                  {3}
    condition             {4}
    delivery_charge       {"5"}
    delivery_way          {"6"}
    delivery_days          {"7"}
    price                 {1000}
    saler_id              {8}
    brand_id              {"9"}
    status                {10}
    created_at            { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end