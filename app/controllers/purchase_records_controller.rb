class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_params)
    if @purchase_record_shipping_address.valid?
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_record_params
  params.require(:purchase_record_shipping_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
