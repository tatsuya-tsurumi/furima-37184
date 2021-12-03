class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation
  before_action :purchase_record_params

  def index
    

    @items = PurchaseRecordShippingAddress.new
    
  end

  def new
    
  end

  def create
   
 
    
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    
    redirect_to root_path unless current_user != @item.user
  end

  def purchase_record_params
    if  @item.purchase_record.present?
      redirect_to root_path
    end
  end

  
  

end
