FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    prefecture_id {1}
    city {'札幌市'}
    street {'1000-1'}
    building {'札幌ハイツ'}
    phone_number {'08012345678'}
    item_id {'1'}
    user_id {'1'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
