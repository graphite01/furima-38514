require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe  'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_name_chineseとfirst_name_chinese、last_name_katakanaとfirst_name_katakana、birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password  is invalid. Include both letters and numbers')
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password  is invalid. Include both letters and numbers')
      end
      it 'passwordは全角文字では登録できない' do
        @user.password = 'ｔｅｓｔ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password  is invalid. Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test123'
        @user.password_confirmation = 'test124'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_name_chineseが空では登録できない' do
        @user.last_name_chinese = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name chinese can't be blank",
                                                      'Last name chinese  is invalid. Input full-width characters')
      end
      it 'first_name_chineseが空では登録できない' do
        @user.first_name_chinese = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name chinese can't be blank",
                                                      'First name chinese  is invalid. Input full-width characters')
      end
      it 'last_name_chineseが全角(漢字・ひらがな・カタカナ))でなければ登録できない' do
        @user.last_name_chinese = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name chinese  is invalid. Input full-width characters')
      end
      it 'first_name_chineseが全角(漢字・ひらがな・カタカナ))でなければ登録できない' do
        @user.first_name_chinese = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name chinese  is invalid. Input full-width characters')
      end
      it 'last_name_katakanaが空では登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank",
                                                      'Last name katakana  is invalid. Input full-width katakana characters')
      end
      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank",
                                                      'First name katakana  is invalid. Input full-width katakana characters')
      end
      it 'last_name_katakanaが全角(カタカナ))でなければ登録できない' do
        @user.last_name_katakana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana  is invalid. Input full-width katakana characters')
      end
      it 'first_name_katakanaが全角(カタカナ))でなければ登録できない' do
        @user.first_name_katakana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana  is invalid. Input full-width katakana characters')
      end
      it '生年月日が無い場合は登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
