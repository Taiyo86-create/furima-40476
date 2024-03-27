class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @payment_form = PaymentForm.new
    unless user_signed_in? && current_user != @item.user && !@item.purchase.present?
      redirect_to user_signed_in? ? root_path : new_user_session_path
    end
  end

  def create
    @payment_form = PaymentForm.new(payment_form_params)
    @item = Item.find(params[:item_id])
    if @payment_form.valid?
      Payjp.api_key = "sk_test_823f95eefb5f5970be90a4db"
      Payjp::Charge.create(
        amount: @item.price,
        card: payment_form_params[:token],
        currency: 'jpy'
      )
      @payment_form.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def payment_form_params
    params.require(:payment_form).permit(:post_code, :prefecture_id, :client_city, :client_local, :client_building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
