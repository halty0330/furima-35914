class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :area_id, :city, :address, :code, :building_name, :telephone_number, :purchase

  with_options presence: true do
    validates :city
    validates :address
    validates :code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(area_id: area_id, city: city, address: address, code: code, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end