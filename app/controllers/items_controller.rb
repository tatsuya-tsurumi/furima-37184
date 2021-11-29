class ItemsController < ApplicationController
  before_action :item_validates, except: [:index]
  def index
     @item = Item.all.order("created_at DESC")
  
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:products, :products_explanation, :category_id, :state_id, :delivery_charge_id, :region_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_validates
    redirect_to new_user_session_path unless user_signed_in?
  end
end
