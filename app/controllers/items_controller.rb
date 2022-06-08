class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    @item_form.tag_name = @item.tags&.first&.tag_name
   

    redirect_to root_path if @item.user_id != current_user.id || @item.purchase_record.present?
  end

  def update
    @item_form = ItemForm.new(item_form_params)

    @item_form.image ||= @item.image.blob

    if @item_form.valid?
      @item_form.update(item_form_params, @item)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id
    redirect_to root_path
  end

  private

  def item_form_params
    params.require(:item_form).permit(:image, :name, :item_explanation, :category_id, :item_condition_id, :delivery_fee_id,
                                 :prefecture_id, :shipping_day_id, :price, :tag_name).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
