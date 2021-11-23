class Purchase < ApplicationRecord
  has_one :shippings
  belongs_to :item 
  belongs_to :user

end
