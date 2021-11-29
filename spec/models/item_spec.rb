require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報の保存' do
    context '出品情報が保存できる場合' do
      it '全ての情報が入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '出品情報が保存できない場合' do
      it '商品画像が空では保存できない' do
        @item.image = nil
        @item.valid?

        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @item.products = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Products can't be blank")
      end
      it '商品説明が空では保存できない' do
        @item.products_explanation = ''
        @item.valid?

        expect(@item.errors.full_messages).to include("Products explanation can't be blank")
      end
      it 'カテゴリーが---では保存できない' do
        @item.category_id = '1'
        @item.valid?

        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が---では保存できない' do
        @item.state_id = '1'
        @item.valid?

        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it '配送料の負担が---では保存できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域が---では保存できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it '発送までの日数が---では保存できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '価格が¥300未満だと保存できない' do
        @item.price = 299
        @item.valid?

        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '価格が¥10,000,000だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '価格が全角数字だと保存できない' do
        @item.price = '１０００'
        @item.valid?

        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが紐づいていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
