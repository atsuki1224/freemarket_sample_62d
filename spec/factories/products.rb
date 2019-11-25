FactoryBot.define do
    
    FactoryBot.define do
      factory :product do
        item_name       {'hoge'}
        description     {'hogehoge'}
        item_condition  {'未使用に近い'}
        trade_status    {0}
        size            {'S'}
        bland_id        {10}
        category_id     {1}
        delivery_charge {'送料込み'}
        delivery_method {'未定'}
        delivery_area   {'青森県'}
        delivery_time   {'1~2日で発送'}
        price           {1200}
        user_id         {1}
      end

    end

  # factory :product do
  #   item_name {"pen"}
  #   description {"this is a pen"}
  #   item_condition {"1"}
  #   trade_status {"good"}
  #   category_id {"1"}
  #   delivery_charge {"100"}
  #   delivery_methot {"aaa"}
  #   delivery_area {"tokyo"}
  #   delivery_time {"60"}
  #   price {"1000"}
  #   user_id {"1"}
  #   size {"1"}
  #   bland_id {"1"}
  #   created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  # end

end
