class ItemsController < ApplicationController
  def index
  end

  def new

  end

  def create
    Item.create(item_params)
    redirect_to items_path
  end

  private
  def item_params
  params.require(:item).permit(:itemsName, :itemsFeature, :category_id, :price, :status_id, :delivery_charge_id, :prefecture_id, :schedule_id, :use, :image )
  end
end
