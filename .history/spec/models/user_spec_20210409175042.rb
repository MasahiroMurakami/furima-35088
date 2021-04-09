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
      it "nicknameがない場合は登録できないこと" do 
        user.valid? #バリデーションメソッドを使用して「バリデーションにより保存ができない状態であるか」をテスト
        expect(user.errors[:nickname]).to include("を入力してください") # errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end
    end
  end
end
