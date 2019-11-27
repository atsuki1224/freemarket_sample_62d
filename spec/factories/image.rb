FactoryBot.define do
  FactoryBot.define do
    factory :image do
      image{File.open("#{Rails.root}/public/images/test.jpg")}
      product_id {1}
    end
  end
end
