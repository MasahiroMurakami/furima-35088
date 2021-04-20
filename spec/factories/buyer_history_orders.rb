FactoryBot.define do
  factory :buyer_history_order do
    token               {"tok_abcdefghijk00000000000000000"}
    post_code           {'111-1111'}
    prefecture_id       {2}
    city                {'test市test'}
    addresses           {'test-1-2'}
    building            {'testマンション102'}
    phone_number        {'08012345678'}
  end
end
