FactoryBot.define do

  FactoryBot.define do
    factory :user do
      email{Faker::Internet.email}
      password{ "00000000" }
      firstname{Faker::Name.first_name}
      firstname_kana{Faker::Name.first_name}
      lastname{Faker::Name.last_name}
      lastname_kana{Faker::Name.last_name}
      nickname{Faker::Name.middle_name}
      birthday{Faker::Date.birthday(min_age: 18, max_age: 60)}
      total_profit{0}
      point{0}
      user_profile{"はじめまして"}
    end
  end

end
