FactoryBot.define do

  FactoryBot.define do
    factory :card do
      card_number{ "4242424242424242" }
      validated_data{ "202012" }
      security_code{ 123 }
      user
    end
  end

end
