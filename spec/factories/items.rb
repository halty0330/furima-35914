FactoryBot.define do
  factory :item do
    item_name            { 'book' }
    price                { '999' }
    category_id          { '3' }
    explanation          { '新品' }
    condition_id         { '2' }
    fee_id               { '3' }
    area_id              { '4' }
    scheduled_day_id     { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
