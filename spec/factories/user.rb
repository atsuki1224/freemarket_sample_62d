FactoryBot.define do

  FactoryBot.define do
    factory :user do
      name{Faker::Name.last_name}

    end
  end

end
