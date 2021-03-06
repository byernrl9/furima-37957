require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザー名を入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordがpassword_confirmationが不一致では登録できない' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1a1'
        @user.password_confirmation = 'a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字混同で設定してください')
      end
      it 'passwordが半角英語のみでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字混同で設定してください')
      end
      it 'passwordが全角英数字が入ってると登録できない' do
        @user.password = 'ABCDEFG'
        @user.password_confirmation = 'ABCDEFG'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字混同で設定してください')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(氏)を入力してください')
      end
      it 'family_nameが全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.family_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(氏)全角（漢字、ひらがな、カタカナ）を使用してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(名)を入力してください')
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(名)全角（漢字、ひらがな、カタカナ）を使用してください')
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前のフリガナ(氏)を入力してください')
      end
      it 'family_name_kanaが全角（カタカナ）でないと登録できない' do
        @user.family_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前のフリガナ(氏)全角（カタカナ）を使用してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前のフリガナ(名)を入力してください')
      end
      it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前のフリガナ(名)全角（カタカナ）を使用してください')
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
