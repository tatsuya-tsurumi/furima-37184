class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:products, :products_explanation, :category_id, :state_id, :delivery_charge_id, :region_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
  
end
