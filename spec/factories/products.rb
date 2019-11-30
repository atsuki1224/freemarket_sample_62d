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
end
