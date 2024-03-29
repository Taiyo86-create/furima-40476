require 'rails_helper'


RSpec.describe PaymentForm, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @payment_form = FactoryBot.build(:payment_form, user_id: user.id, item_id: item.id)
  end

  context "正常系" do
    it "正しい情報を入力すると購入できる" do
      @payment_form.post_code = "123-4567"
      @payment_form.phone_number = "09012345678"

      expect(@payment_form).to be_valid
    end

    it "建物名が空の場合でも購入できる" do
      @payment_form.client_building = ""
      @payment_form.post_code = "123-4567"
      @payment_form.phone_number = "09012345678"
      expect(@payment_form).to be_valid
    end

  end

  context "異常系" do
    it "prefecture_idが1以下の場合は出品できない" do
      @payment_form.prefecture_id = 1
      @payment_form.valid?
      expect(@payment_form.errors[:prefecture_id]).to include("must be other than 1")
    end

    it "post_codeが空だと購入できない" do
      @payment_form.post_code = nil
      expect(@payment_form).not_to be_valid
    end

    it "post_codeが「3桁ハイフン4桁」の半角文字列でないと購入できない" do
      @payment_form.post_code = "1234567"
      expect(@payment_form).not_to be_valid
    end

    it "client_cityが空だと購入できない" do
      @payment_form.client_city = nil
      expect(@payment_form).not_to be_valid
    end

    it "client_localが空だと購入できない" do
      @payment_form.client_local = nil
      expect(@payment_form).not_to be_valid
    end

    it "phone_numberが空だと購入できない" do
      @payment_form.phone_number = nil
      expect(@payment_form).not_to be_valid
    end

    it "phone_numberは9桁では保存できない" do
      @payment_form.phone_number = "123456789"
      expect(@payment_form).not_to be_valid
    end

    it "phone_numberは11桁では保存できない" do
      @payment_form.phone_number = "12345678901"
      expect(@payment_form).not_to be_valid
    end

    it "phone_numberは12桁では保存できない" do
      @payment_form.phone_number = "123456789012"
      expect(@payment_form).not_to be_valid
    end


    it "phone_numberは10桁以上11桁以内の半角数値でないと保存できない" do
      @payment_form.phone_number = "1234567890a"
      expect(@payment_form).not_to be_valid
    end

    it 'トークンが空だと購入できない' do
      @payment_form.token =''
      expect(@payment_form).not_to be_valid
    end

    it "user_idが空の場合は購入できない" do
      @payment_form.user_id = nil
      expect(@payment_form).not_to be_valid
    end

    it "item_idが空の場合は購入できない" do
      @payment_form.item_id = nil
      expect(@payment_form).not_to be_valid
    end
  end

end
