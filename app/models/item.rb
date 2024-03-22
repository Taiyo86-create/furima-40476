class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :category_id, numericality: { other_than: 1 }

  # カテゴリーのアクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status


end
