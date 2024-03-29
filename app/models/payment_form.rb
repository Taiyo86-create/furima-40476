class PaymentForm
  include ActiveModel::Model


  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :client_city, :client_local, :client_building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む3桁ハイフン4桁の形式で入力してください" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :client_city, :client_local, :user_id, :item_id, :token
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください" }
  end
  validates :client_building, length: { maximum: 100 }


  def save
    return false unless valid?

    # 決済情報を保存
    purchase = Purchase.create(
      user_id: user_id,
      item_id: item_id
    )

    # 配送先情報を保存
    address = Address.create(
      purchase_id: purchase.id,
      post_code: post_code,
      prefecture_id: prefecture_id,
      client_city: client_city,
      client_local: client_local,
      client_building: client_building,
      phone_number: phone_number
    )


  end
end
