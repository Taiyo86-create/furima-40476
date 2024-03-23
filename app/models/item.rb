class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :category_id, numericality: { other_than: 1 }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :schedule


  validates :itemsName, presence: true
  validates :itemsFeature, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :schedule_id, numericality: { other_than: 1 }

end
