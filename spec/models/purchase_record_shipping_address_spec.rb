require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, user_id: user.id, item_id: @item)
    end

    context '内容に問題ない場合' do
      it '全ての情報が正しく入力されていれば保存できること 電話番号は11桁' do
        expect(@purchase_record_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchase_record_shipping_address.building = ""
        expect(@purchase_record_shipping_address).to be_valid
      end
      it 'phone_numberは10桁でも保存できる' do
        @purchase_record_shipping_address.phone_number = "1234567890"
        expect(@purchase_record_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_record_shipping_address.postal_code = ""
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが---だと保存できない' do
        @purchase_record_shipping_address.prefecture_id = "1"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_record_shipping_address.city = ""
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できない' do
        @purchase_record_shipping_address.block = ""
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_record_shipping_address.phone_number = ""
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下だと保存できない' do
        @purchase_record_shipping_address.phone_number = "123456789"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが全角だと保存できない' do
        @purchase_record_shipping_address.phone_number = "１２３４５６７８９０"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'postal_codeが全角だと保存できない' do
        @purchase_record_shipping_address.postal_code = "１２３−１２３４"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeに-がないと保存できない' do
        @purchase_record_shipping_address.postal_code = "1234567"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが３桁-でないと保存できない' do
        @purchase_record_shipping_address.postal_code = "12-34567"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが-4桁でないと保存できない' do
        @purchase_record_shipping_address.postal_code = "123-456"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'userが紐づいてないと保存できない' do
        @purchase_record_shipping_address.user_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいてないと保存できない' do
        @purchase_record_shipping_address.item_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できない' do
       @purchase_record_shipping_address.token = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_record_shipping_address.phone_number = "123456789012"
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    end

  end
end
