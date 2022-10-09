require 'rails_helper'

RSpec.describe CommodityExhibition, type: :model do
  before do
    @commodity_exhibition = FactoryBot.build(:commodity_exhibition)
  end

  describe  '商品出品' do
    context '商品出品できるとき' do
      it 'imageとitem_name、explanationとdetail_category、detail_situationとdelivery_charge、days_to_shipとselling_priceが存在すれば出品できる' do
        expect(@commodity_exhibition).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'imageが空では出品できない' do
        @commodity_exhibition.image = nil
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @commodity_exhibition.item_name = ''
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explanationが空では出品できない' do
        @commodity_exhibition.explanation = ''
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'detail_categoryが空では出品できない' do
        @commodity_exhibition.detail_category_id = 1
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Detail category cant't be blank")
      end
      it 'detail_situationが空では出品できない' do
        @commodity_exhibition.detail_situation_id = 1
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Detail situation cant't be blank")
      end
      it 'delivery_chargeが空では出品できない' do
        @commodity_exhibition.delivery_charge_id = 1
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Delivery charge cant't be blank")
      end
      it 'prefectureが空では出品できない' do
        @commodity_exhibition.prefecture_id = 1
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Prefecture cant't be blank")
      end
      it 'days_to_shipが空では出品できない' do
        @commodity_exhibition.days_to_ship_id = 1
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Days to ship cant't be blank")
      end
      it 'selling_priceが空では出品できない' do
        @commodity_exhibition.selling_price = ''
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'selling_priceが300未満では出品できない' do
        @commodity_exhibition.selling_price = '299'
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include('Selling price  is out of setting range')
      end
      it 'selling_priceが9,999,999超えでは出品できない' do
        @commodity_exhibition.selling_price = '10000000'
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include('Selling price  is out of setting range')
      end
      it 'selling_priceが全角では出品できない' do
        @commodity_exhibition.selling_price = '３００'
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include('Selling price  is out of setting range')
      end
      it 'selling_priceが文字では出品できない' do
        @commodity_exhibition.selling_price = 'test'
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include('Selling price  is out of setting range')
      end
      it 'userが紐ついていないと出品できない' do
        @commodity_exhibition.user = nil
        @commodity_exhibition.valid?
        expect(@commodity_exhibition.errors.full_messages).to include('User must exist')
      end
    end
  end
end
