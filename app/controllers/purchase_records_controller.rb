class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new

    if @item.user_id == current_user.id || @item.purchase_record != nil
      redirect_to root_path
    end
  end

  def create
    @purchase_record_shipping_address = PurchaseRecordShippingAddress.new(purchase_record_params)
    if @purchase_record_shipping_address.valid?
      pay_item
      @purchase_record_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record_shipping_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_num).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
