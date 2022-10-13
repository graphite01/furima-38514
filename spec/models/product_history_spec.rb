require 'rails_helper'

RSpec.describe ProductHistory, type: :model do
  before do
    user = FactoryBot.create(:user)
    commodity_exhibition = FactoryBot.create(:commodity_exhibition)
    @product_history = FactoryBot.build(:product_history, user_id: user.id, commodity_exhibition_id: commodity_exhibition.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'post_code、municipalities、address、phone_number、prefecture_id、tokenが存在すれば購入できる' do
        expect(@product_history).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @product_history.building_name = ''
        expect(@product_history).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it '郵便番号が空では購入できない' do
        @product_history.post_code = ''
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("Post code can't be blank",
                                                                 'Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '郵便番号はハイフンがなければ購入できない' do
        @product_history.post_code = '1234567'
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が選択されていなければ購入できない' do
        @product_history.prefecture_id = 1
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @product_history.municipalities = ''
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では購入できない' do
        @product_history.address = ''
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @product_history.phone_number = ''
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に半角数値以外が入力されていると購入できない' do
        @product_history.phone_number = '080-0000-0000'
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号は9桁以下では購入できない' do
        @product_history.phone_number = '12345678'
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号は12桁以上では購入できない' do
        @product_history.phone_number = '123456789012'
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'トークンが空だと購入できない' do
        @product_history.token = ''
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("Token can't be blank")
      end
      it 'ユーザー情報がないと購入できない' do
        @product_history.user_id = nil
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報がないと購入できない' do
        @product_history.commodity_exhibition_id = nil
        @product_history.valid?
        expect(@product_history.errors.full_messages).to include("Commodity exhibition can't be blank")
      end
    end
  end
end
