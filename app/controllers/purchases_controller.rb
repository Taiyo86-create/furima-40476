class PurchasesController < ApplicationController
  before_action :setting_item, only: [:index, :create]
  def index
    @payment_form = PaymentForm.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    unless user_signed_in? && current_user != @item.user && !@item.purchase.present?
      redirect_to user_signed_in? ? root_path : new_user_session_path
    end
  end

  def create
    @payment_form = PaymentForm.new(payment_form_params)
    if @payment_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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

  def setting_item
    @item = Item.find(params[:item_id])
  end
end
