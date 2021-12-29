require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば新規登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
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
      it '重複したemailでは登録できない' do
        @user.save
        anothor_user = FactoryBot.build(:user)
        anothor_user.email = @user.email
        anothor_user.valid?
        expect(anothor_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@を含まないとき登録できない' do
        @user.email = 'aaabbbccc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが等しくないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa112'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaabbb'
        @user.password_confirmation = 'aaabbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111222'
        @user.password_confirmation = '111222'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに全角文字を含むと登録できない' do
        @user.password = '111　bcd'
        @user.password_confirmation = '111　bcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_nameに半角文字を含むとき登録できない' do
        @user.last_name = '山田a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameに半角文字を含むとき登録できない' do
        @user.first_name = '陸太郎b'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'last_name_kanaにカタカナ以外のひらがなを含むとき登録できない' do
        @user.last_name_kana = 'ヤマダあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'last_name_kanaにカタカナ以外の漢字を含むとき登録できない' do
        @user.last_name_kana = 'ヤマダ亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'last_name_kanaにカタカナ以外の英数字を含むとき登録できない' do
        @user.last_name_kana = 'ヤマダa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'last_name_kanaにカタカナ以外の記号を含むとき登録できない' do
        @user.last_name_kana = 'ヤマダ#'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaにカタカナ以外を含むとき登録できない' do
        @user.last_name_kana = 'リクタロウb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
    end
  end
end
