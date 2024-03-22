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
        @user.password = "password1"
        @user.password_confirmation = "password1"
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
      it 'ニックネームが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it '重複したメールアドレスは登録できない' do
        existing_user = FactoryBot.create(:user, email: "test@example.com")
        @user.email = "test@example.com"
        @user.valid?
        expect(@user.errors[:email]).to include("has already been taken")
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = "invalidemail.com"
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end

      it 'パスワードが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = "pass"
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = "password"
        @user.valid?
        expect(@user.errors[:password]).to include("は半角英数字混合で入力してください")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors[:password]).to include("は半角英数字混合で入力してください")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = "パスワード"
        @user.valid?
        expect(@user.errors[:password]).to include("は半角英数字混合で入力してください")
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password_confirmation = "password123"
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it '姓（全角）が空だと登録できない' do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors[:lastname]).to include("can't be blank")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.lastname = "Yamada"
        @user.valid?
        expect(@user.errors[:lastname]).to include("は全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it '名（全角）が空だと登録できない' do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors[:firstname]).to include("can't be blank")
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.firstname = "Taro"
        @user.valid?
        expect(@user.errors[:firstname]).to include("は全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it '姓（カナ）が空だと登録できない' do
        @user.lastname_kana = nil
        @user.valid?
        expect(@user.errors[:lastname_kana]).to include("can't be blank")
      end

      it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.lastname_kana = "やまだ"
        @user.valid?
        expect(@user.errors[:lastname_kana]).to include("は全角カタカナで入力してください")
      end

      it '名（カナ）が空だと登録できない' do
        @user.firstname_kana = nil
        @user.valid?
        expect(@user.errors[:firstname_kana]).to include("can't be blank")
      end

      it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.firstname_kana = "たろう"
        @user.valid?
        expect(@user.errors[:firstname_kana]).to include("は全角カタカナで入力してください")
      end

      it '生年月日が空だと登録できない' do
        @user.birth = nil
        @user.valid?
        expect(@user.errors[:birth]).to include("can't be blank")
      end
    end



  end
end
