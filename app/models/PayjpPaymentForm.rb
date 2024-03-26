class PayjpPaymentForm
  include ActiveModel::Model

  attr_accessor :card_number, :exp_month, :exp_year, :cvc
  attr_accessor :post_code, :prefecture_id, :client_city, :client_local, :client_building, :phone_number

  validates :card_number, presence: true
  validates :exp_month, presence: true
  validates :exp_year, presence: true
  validates :cvc, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "はハイフンを含む3桁ハイフン4桁の形式で入力してください" }
  validates :prefecture_id, presence: true
  validates :client_city, presence: true
  validates :client_local, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください" }

  def save
    return false unless valid?

    # 決済情報を保存
    payment = Payment.create(
      card_number: card_number,
      exp_month: exp_month,
      exp_year: exp_year,
      cvc: cvc
    )

    # 配送先情報を保存
    address = Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      client_city: client_city,
      client_local: client_local,
      client_building: client_building,
      phone_number: phone_number
    )

    # 決済情報と配送先情報が正常に保存された場合は true を返す
    payment.persisted? && address.persisted?
  end
end
