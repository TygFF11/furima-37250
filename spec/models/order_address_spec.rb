require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    sleep(0.5)
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id )
  end
  
  describe '商品購入機能' do
    context '正しく商品情報を入力すると保存できる' do
      it '正しく情報を入力すると保存できる' do
        sleep(0.3)
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        sleep(0.3)
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end
    context '正しく商品情報を入力しないと保存できない' do
      it '郵便番号が空だと保存できない' do
        sleep(0.3)
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に-がないと保存できない' do
        sleep(0.3)
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空(perfecture_idが1)だと保存できない' do
        sleep(0.3)
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        sleep(0.3)
        @order_address.urban_town_village = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Urban town village can't be blank")
      end
      it '番地が空だと保存できない' do
        sleep(0.3)
        @order_address.village_address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Village address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        sleep(0.3)
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に-が入力されていると保存できない' do
        sleep(0.3)
        @order_address.phone_number = "090-8877-6655"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下だと保存できない' do
        sleep(0.3)
        @order_address.phone_number = "090887665"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上だと保存できない' do
        sleep(0.3)
        @order_address.phone_number = "0908877665544332211"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空だと保存できない' do
        sleep(0.3)
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ保存できない' do
        sleep(0.3)
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ保存できない' do
        sleep(0.3)
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end

  end
end
