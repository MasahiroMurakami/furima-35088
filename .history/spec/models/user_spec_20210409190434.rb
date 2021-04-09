require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context  '新規登録できるとき' do
      it "全ての項目の入力が存在すれば登録できること" do 
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できること" do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
    end

    context  '新規登録できないとき' do
      it "nicknameが空の場合は登録できないこと" do 
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        binding.pry
        expect(@user.errors[:password_confirmation]).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
