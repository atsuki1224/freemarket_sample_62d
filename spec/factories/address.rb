FactoryBot.define do

  FactoryBot.define do
    factory :address do
      zipcode{"111-1111"}
      prefecture_id{Faker::Number.between(from: 1, to: 47)}
      city{ "北区" }
      address{"1-2-3"}
      building_name{"イーストビル"}
      phone_number{Faker::PhoneNumber.cell_phone}
      user
    end
  end

end
