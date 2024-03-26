class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to :prefecture

  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は無効です。正しい形式で入力してください（例：123-4567）" }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :client_city, presence: true
  validates :client_local, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
  validates :client_building, allow_blank: true
end
