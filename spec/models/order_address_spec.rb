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
    end
    context '正しく商品情報を入力しないと保存できない' do
      it 'postal_codeが空だと保存できない' do
        sleep(0.3)
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-がないと保存できない' do
        sleep(0.3)
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと保存できない' do
        sleep(0.3)
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'urban_town_villageが空だと保存できない' do
        sleep(0.3)
        @order_address.urban_town_village = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Urban town village can't be blank")
      end
      it 'village_addressが空だと保存できない' do
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
      it 'phone_numberに-が入力されていると保存できない' do
        sleep(0.3)
        @order_address.phone_number = "090-8877-6655"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空だと保存できない' do
        sleep(0.3)
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
end
