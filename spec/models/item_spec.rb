require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる。' do
      it '商品画像、商品名、商品の説明、カテゴリーid、状態id、配達料id、地域id、日数id、販売価格が存在すれば商品出品できる。' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない。' do
      it '商品画像が存在しなければ商品出品できない。' do
        @item.image = nil
        @item.valid?

        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が存在しなければ商品出品できない。' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が存在しなければ商品出品できない。' do
        @item.item_describe = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item describe can't be blank")
      end
      it 'カテゴリーidが存在しなければ商品出品できない。' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'カテゴリーidが1の時、商品出品できない。' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it '状態idが存在しなければ商品出品できない。' do
        @item.item_show_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item show can't be blank")
      end
      it '状態idが1の時、商品出品できない。' do
        @item.item_show_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item show can't be blank")
      end
      it '配達料idが存在しなければ商品出品できない。' do
        @item.item_delivary_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item delivary can't be blank")
      end
      it '配達料idが1の時、商品出品できない。' do
        @item.item_delivary_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item delivary can't be blank")
      end
      it '地域idが存在しなければ商品出品できない。' do
        @item.perfecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Perfecture can't be blank")
      end
      it '地域idが1の時、商品出品できない。' do
        @item.perfecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Perfecture can't be blank")
      end
      it '日数idが存在しなければ商品出品できない。' do
        @item.item_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item day can't be blank")
      end
      it '日数idが1の時、商品出品できない。' do
        @item.item_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item day can't be blank")
      end
      it '商品価格が存在しなければ商品出品できない。' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '商品価格が半角英数字以外の時、商品出品できない。' do
        @item.item_price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '商品価格が300円未満の時、商品出品できない。' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '商品価格が9,999,999円以上の時、商品出品できない。' do
        @item.item_price = 1_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it 'userが紐づいていない時、商品出品できない。' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
