FactoryBot.define do

  factory :product do
    item_name {"pen"}    
    description {"this is a pen"}      
    item_condition {2} 
    trade_status {"good"}   
    category_id {235}   
    delivery_charge {1}
    delivery_method {1}
    delivery_area {1}  
    delivery_time {1}  
    price {1000}         
    user_id {1} 
    size {1}           
    bland_id {1}      
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }     
  end

end