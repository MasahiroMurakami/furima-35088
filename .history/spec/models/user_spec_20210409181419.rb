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

      it "encrypted_passwordが空では登録できないこと" do
        @user.encrypted_password = ''
        @user.valid?
        expect(user.errors.full_messages).to include("を入力してください")
      end
    end
  end
end
