FactoryBot.define do
  factory :user do
    nickname              {"tarochan"}
    email                 {"tarochan@gmail.com"}
    password              {"00000000"}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birthday              {"20200101"}
    phone                 {"012345678910"}
  end
end