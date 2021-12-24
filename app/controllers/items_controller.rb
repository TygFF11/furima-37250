class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @items = Item.all
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(Item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def Item_params
    params.require(:item).permit(:item_name, :item_describe, :item_price, :image).merge(user_id: current_user.id)
  end
  
end
