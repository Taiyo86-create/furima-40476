class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")


  end

  def new
    @item = Item.new
    unless user_signed_in?
      render 'devise/sessions/new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:itemsName, :itemsFeature, :category_id, :price, :status_id, :delivery_charge_id, :prefecture_id, :schedule_id, :image).merge(user_id: current_user.id)
  end
end
