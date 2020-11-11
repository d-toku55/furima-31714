require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規出品' do
    context '新規出品がうまくいくとき' do
      it '全ての値が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '新規出品がうまくいかないとき' do
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空のとき' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空のとき' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空のとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字のとき' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが300円以下のとき' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが9999999円以上のとき' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'status_idが1のとき' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'status_idが空のとき' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it 'category_idが1のとき' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'category_idが空のとき' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'delivery_area_idが1のとき' do
        @item.delivery_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it 'delivery_area_idが空のとき' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area is not a number')
      end
      it 'delivery_days_idが1のとき' do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days must be other than 1')
      end
      it 'delivery_days_idが空のとき' do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery days is not a number')
      end
      it 'delivery_burden_idが1のとき' do
        @item.delivery_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden must be other than 1')
      end
      it 'delivery_burden_idが空のとき' do
        @item.delivery_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden is not a number')
      end
      it 'ユーザーが紐付いていないと商品は保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
