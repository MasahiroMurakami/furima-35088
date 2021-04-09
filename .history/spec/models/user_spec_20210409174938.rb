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
      
    end
  end
end
