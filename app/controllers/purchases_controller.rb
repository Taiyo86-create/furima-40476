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
