class ShippingForm
  include ActiveModel::Model
  attr_accessor :area_id, :city, :address, :code, :building_name, :telephone_number, :purchase

  # ここにバリデーションの処理を書く
  validates :area_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :code, presence: true
  validates :building_name, presence: true
  validates :telephone_number, presence: true
  validates :purchase, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
    Purchase.create(text: text)
    Shipping.create(genre: genre)
 
  end
end