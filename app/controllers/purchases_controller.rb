class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    unless user_signed_in? && current_user != @item.user
      redirect_to user_signed_in? ? root_path : new_user_session_path
    end
  end

end
