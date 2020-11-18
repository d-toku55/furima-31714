require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @record_address = FactoryBot.build(:record_address)
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@record_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @record_address.building_name = nil
        expect(@record_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'tokenが空では登録できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空のとき' do
        @record_address.postal_code = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないとき' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空のとき' do
        @record_address.prefectures_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      it '都道府県idが1のとき' do
        @record_address.prefectures_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Prefectures must be other than 1')
      end

      it '市区町村が空のとき' do
        @record_address.municipality = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空のとき' do
        @record_address.address = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空のとき' do
        @record_address.phone_number = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフンが含まれるとき' do
        @record_address.phone_number = '080-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
