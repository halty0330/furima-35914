FactoryBot.define do
  factory :order_form do
    code { '123-4567' }
    area_id { 1 }
    city { '福岡県' }
    address { '1-1' }
    building_name { '福岡ビル' }
    telephone_number { '09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
