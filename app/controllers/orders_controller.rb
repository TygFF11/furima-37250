class OrdersController < ApplicationController
  # before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.permit(:postal_code,:prefecture_id,:urban_town_village,:village_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
