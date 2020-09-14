FactoryBot.define do
    factory :user do
      nickname              {"abe"}
      email                 {Faker::Internet.email}
      password              {"0aa00b"}
      password_confirmation {password}    
      family_name             {"阿部"}
      first_name            {"カタカナ"}
      family_name_kana      {"カタカナ"}
      first_name_kana       {"カタカナ"}
      birth_day             {000000}
    end
end