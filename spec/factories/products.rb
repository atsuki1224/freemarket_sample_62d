FactoryBot.define do

  factory :product do
    item_name {"pen"}    
    description {"this is a pen"}      
    item_condition {"1"} 
    trade_status {"good"}   
    category_id {"1"}   
    delivery_charge {"100"}
    delivery_methot {"aaa"}
    delivery_area {"tokyo"}  
    delivery_time {"60"}  
    price {"1000"}         
    user_id {"1"} 
    size {"1"}           
    bland_id {"1"}      
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }     
  end

end