class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :scheduled_day

  has_one_attached :image


  validates :item_name, :string, presence: true
  validates :explanation, :text, presence: true
  validates :category_id, :integer, presence: true
  validates :condition_id, :integer, presence: true
  validates :fee_id, :integer, presence: true
  validates :condition_id, :integer, presence: true
  validates :area_id, :integer, presence: true
  validates :scheduled_day_id, :integer, presence: true
  validates :price, :integer, presence: true
  validates :image, :string, presence: true


  

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_day_id, numericality: { other_than: 1 , message: "can't be blank"}

end
