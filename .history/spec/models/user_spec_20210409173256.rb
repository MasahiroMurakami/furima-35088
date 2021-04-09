require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての項目の入力が存在すれば登録できること" do 
      expect(@user).to be_valid
    end
  
end
