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
    
    @items = PurchaseRecordShippingAddress.new(purchase_record_params)
    
    if @items.valid?
      @items.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 

  def purchase_record_params
    
    params.require(:purchase_record_shipping_address).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
