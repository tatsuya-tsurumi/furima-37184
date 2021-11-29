FactoryBot.define do
  factory :item do
    products {'テスト'}
    products_explanation {'テスト'}
    category_id {2}
    state_id {2}
    delivery_charge_id {2}
    region_id {2}
    shipping_date_id {2}
    price {2000}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
