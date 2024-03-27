class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    unless user_signed_in? && current_user != @item.user
      redirect_to user_signed_in? ? root_path : new_user_session_path
    end
  end

  def new
    @purchase = Purchase.new
    @address = Address.new
  end

  def create
    @payment_form = PayjpPaymentForm.new(payment_form_params)

    if @payment_form.save
      Payjp.api_key = "sk_test_823f95eefb5f5970be90a4db"
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def payment_form_params
    params.require(:payjp_payment_form).permit(
      :card_number, :exp_month, :exp_year, :cvc,
      :post_code, :prefecture_id, :client_city, :client_local, :client_building, :phone_number
    )
  end
end
