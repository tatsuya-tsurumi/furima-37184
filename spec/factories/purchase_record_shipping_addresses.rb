FactoryBot.define do
  factory :purchase_record_shipping_address do

     postal_code { '111-1111'}
    prefecture_id { 2 }
    city { '青' }
    block { '山' }
    building { '空' }
    phone_number { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
