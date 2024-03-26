class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    unless user_signed_in? && current_user != @item.user
      redirect_to user_signed_in? ? root_path : new_user_session_path
    end
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :client_city, :client_local, :client_building, :phone_number)
  end

end
