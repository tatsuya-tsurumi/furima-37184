class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @item = Item.find(params[:item_id])
    @items = PurchaseRecordShippingAddress.new
  end

  def new
    
  end

  def create
   
    @item = Item.find(params[:item_id])
    
    @items = PurchaseRecordShippingAddress.new(item_params)
    
    if @items.valid?
      pay_item
      @items.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 

  def item_params
    
    params.require(:purchase_record_shipping_address).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: item_params[:token],
        currency: 'jpy'
      )
  end

  


end
