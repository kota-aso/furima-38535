require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できる場合' do
      it 'item_name,item_description,item_category_id,item_status_id,shipping_charger_id,prefecture_id,days_to_ship_id,price,imageがあれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合' do
      it 'item_nameが空白では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end     
      it 'item_descriptionが空白では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end     
      it 'imageが空白では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end    
      it 'item_category_idが1では出品できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end      
      it 'item_status_idが1では出品できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end      
      it 'shipping_charger_idが1では出品できない' do
        @item.shipping_charger_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end      
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県を選択してください")
      end      
      it 'days_to_ship_idが1では出品できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end      
      it 'priceが300未満では出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300より大きい値にしてください")
      end      
      it 'priceが10000000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999より小さい値にしてください")
      end
      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @item.price = 'Abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it 'ユーザー情報がない場合は出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

