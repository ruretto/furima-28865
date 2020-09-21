FactoryBot.define do

  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"12345a"}
    password_confirmation {"12345a"}
    family_name           {"小林"}
    family_name_kana      {"コバヤシ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end