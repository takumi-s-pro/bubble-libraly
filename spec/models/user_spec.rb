require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      nickname: "テストユーザー",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  describe 'ユーザー新規登録' do
    context '登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        expect(@user).to be_invalid
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        expect(@user).to be_invalid
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        expect(@user).to be_invalid
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'different'
        expect(@user).to be_invalid
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = User.new(
          nickname: "別のユーザー",
          email: @user.email,
          password: "password",
          password_confirmation: "password"
        )
        expect(another_user).to be_invalid
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'invalidemail.com'
        expect(@user).to be_invalid
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        expect(@user).to be_invalid
      end
    end
  end
end