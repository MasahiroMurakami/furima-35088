require 'rails_helper'

RSpec.describe BuyerHistoryOrder, type: :model do
  before do
    
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_history_order = FactoryBot.build(:buyer_history_order, user_id:@user.id, item_id:@item.id)
    sleep 0.1
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@buyer_history_order).to be_valid
      end
    end

    context '商品購入できないとき' do
      #it 'クレジット情報が空の場合は登録できない' do
       #@buyer_history_order.token = nil
        #@buyer_history_order.valid?
        #expect(@buyer_history_order.errors.full_messages).to include("Token can't be blank")
      #end

      it '郵便番号が空の場合は登録できない' do
        @buyer_history_order.post_code = ''
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがないと登録できない' do
        @buyer_history_order.post_code = 1234567
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県が未選択だと出品できない' do
        @buyer_history_order.prefecture_id = 1
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空だと出品できない' do
        @buyer_history_order.city = ''
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと出品できない' do
        @buyer_history_order.addresses = ''
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空では登録できない' do
        @buyer_history_order.phone_number = ''
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁の半角数値でないと登録できない' do
        @buyer_history_order.phone_number = '０８０１２３４５６７８'
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Phone number is not a number")
      end
    end 
  end
end
