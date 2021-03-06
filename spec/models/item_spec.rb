require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context '商品出品が保存できる場合' do
      it '商品画像、商品名、商品の説明、カテゴリー情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格の情報があれば商品出品は保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品出品が保存できない場合' do
      it '商品画像がないと商品出品は保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it '商品の名前がないと商品出品は保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('タイトルを入力してください')
      end
      it '商品の説明がないと商品出品は保存できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品説明を入力してください')
      end
      it 'カテゴリー情報欄が「---」だと商品出品は保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態欄が「---」だと商品出品は保存できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担欄が「---」だと商品出品は保存できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域欄が「---」だと商品出品は保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送日までの日数欄が「---」だと商品出品は保存できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送日までの日数を選択してください')
      end
      it '価格の情報がないと商品出品は保存ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end
      it 'ユーザーが紐付いていないと商品出品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
      it '商品の名前が40字以上だと商品出品は保存できない' do
        @item.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('タイトルは40文字以内で入力してください')
      end
      it '価格が全角文字だと商品出品が保存できない' do
        @item.price = '価格'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it '価格が半角かつ文字の場合商品出品が保存できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it '価格が300以下では商品出品が保存できない' do
        @item.price = 123
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it '商品価格が9999999以上だと商品出品が保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
    end
  end
end
