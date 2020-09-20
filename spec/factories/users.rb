FactoryBot.define do

  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"password"}
    encrypted_password    {"password"}
    family_name           {"小林"}
    family_name_kana      {"コバヤシ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end