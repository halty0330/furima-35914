FactoryBot.define do
  factory :order_form do
    code { '123-4567' }
    area_id { 1 }
    city { '福岡県' }
    address { '1-1' }
    building_name { '福岡ビル' }
    telephone_number { '09012345678'}
  end
end
