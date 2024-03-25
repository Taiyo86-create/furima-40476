require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user, category_id: FactoryBot.create(:category).id, status_id: FactoryBot.create(:status).id, delivery_charge_id: FactoryBot.create(:delivery_charge).id, prefecture_id: FactoryBot.create(:prefecture).id, schedule_id: FactoryBot.create(:schedule).id)
  end


  # 正常系テスト
  context "商品保存できる" do
    it "ログインしたユーザーは出品できる" do
      expect(@item).to be_valid
    end
  end

  # 異常系テスト
  context "when user is not logged in" do
    it "商品名が空だと出品できない" do
      item = FactoryBot.build(:item, itemsName: "")
      item.valid?
      expect(item.errors[:itemsName]).to include("can't be blank")
    end

    it "商品の特徴が空だと出品できない" do
      item = FactoryBot.build(:item, itemsFeature: "")
      item.valid?
      expect(item.errors[:itemsFeature]).to include("can't be blank")
    end

    it "価格が空だと出品できない" do
      item = FactoryBot.build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "価格が半角数字以外だと出品できない" do
      item = FactoryBot.build(:item, price: "１０００")
      item.valid?
      expect(item.errors[:price]).to include("is not a number")
    end

    it "価格の値が300未満の場合は出品できない" do
      item = FactoryBot.build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "価格の値が9999999より大きい場合は出品できない" do
      item = FactoryBot.build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "category_idが1以下の場合は出品できない" do
      item = FactoryBot.build(:item, category_id: 1)
      item.valid?
      expect(item.errors[:category_id]).to include("must be other than 1")
    end

    it "prefecture_idが1以下の場合は出品できない" do
      item = FactoryBot.build(:item, prefecture_id: 1)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("must be other than 1")
    end

    it "delivery_charge_idが1以下の場合は出品できない" do
      item = FactoryBot.build(:item, delivery_charge_id: 1)
      item.valid?
      expect(item.errors[:delivery_charge_id]).to include("must be other than 1")
    end

    it "status_idが1以下の場合は出品できない" do
      item = FactoryBot.build(:item, status_id: 1)
      item.valid?
      expect(item.errors[:status_id]).to include("must be other than 1")
    end

    it "schedule_idが1以下の場合は出品できない" do
      item = FactoryBot.build(:item, schedule_id: 1)
      item.valid?
      expect(item.errors[:schedule_id]).to include("must be other than 1")
    end
  end
end
