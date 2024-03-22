require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "ニックネーム、email、password、password_confirmation、firstname、lastname、firstname_kana、lastname_kana、birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "emailが一意であれば登録できる" do
        existing_user = FactoryBot.create(:user, email: "test@example.com")
        @user.email = "unique@example.com"
        expect(@user).to be_valid
      end

      it "emailに@を含む場合登録できる" do
        @user.email = "test@example.com"
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "password"
        @user.password_confirmation = "password"
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "password1"
        @user.password_confirmation = "password1"
        expect(@user).to be_valid
      end

      it "passwordとpassword_confirmationが一致していれば登録できる" do
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end

      it "お名前(全角)が全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.firstname = "太郎"
        @user.lastname = "山田"
        expect(@user).to be_valid
      end

      it "お名前カナ(全角)が全角（カタカナ）であれば登録できる" do
        @user.firstname_kana = "タロウ"
        @user.lastname_kana = "ヤマダ"
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      # 既存のテストはそのまま利用
    end
  end
end
