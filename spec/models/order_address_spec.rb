require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid

      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号にハイフン（-）を含んでください")
      end
      it 'prefecture_idが0だと保存できないこと' do
        @order_address.prefecture_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecturecan't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市町村区を入力してください")
      end
      it 'streetが空だと保存できないこと' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが10桁以上11桁以内の半角数値以外保存できないこと' do
        @order_address.phone_number = '080-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
     it 'phone_numberが9桁以下では保存できないこと' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
 
     it 'phone_numberが12桁以上では保存できないこと' do
        @order_address.phone_number = '080123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
     it 'phone_numberが半角数字以外が含まれている場合は保存できないこと' do
        @order_address.phone_number = '080１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
      end
     it 'userが紐付いていなければ保存できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
     it 'itemが紐付いていなければ保存できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
 
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end

