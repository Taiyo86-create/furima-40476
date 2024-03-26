class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
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
  end

  def edit
    unless user_signed_in? && current_user == @item.user
      redirect_to user_signed_in? ? root_path : new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:itemsName, :itemsFeature, :category_id, :price, :status_id, :delivery_charge_id, :prefecture_id, :schedule_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
