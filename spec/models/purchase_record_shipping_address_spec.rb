require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, user_id: user.id, item_id: item.id)
    end

    context '商品購入を保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_record_shipping_address.building_name = ''
        expect(@purchase_record_shipping_address).to be_valid
      end
    end

    context '商品購入を保存できない場合' do
      it 'post_codeが空の場合保存できない' do
        @purchase_record_shipping_address.post_code = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '発送元の地域欄が「---」だと商品出品は保存できない' do
        @purchase_record_shipping_address.prefecture_id = 1
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空の場合保存できない' do
        @purchase_record_shipping_address.city = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の場合保存できない' do
        @purchase_record_shipping_address.address = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空の場合保存できない' do
        @purchase_record_shipping_address.phone_num = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'user_idが紐ついてないと保存できない' do
        @purchase_record_shipping_address.user_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐ついてないと保存できない' do
        @purchase_record_shipping_address.item_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @purchase_record_shipping_address.post_code = '1234567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'phone_numは0桁以上11桁以内の半角数値のみでないと保存できない' do
        @purchase_record_shipping_address.phone_num = '0909999'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end
end
