require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  # 正常系テスト
  context "商品保存できる" do
    it "商品名が空だと出品できない" do
      @item.itemsName = ""
      @item.valid?
      expect(@item.errors[:itemsName]).to include("can't be blank")
    end
  end

  # 異常系テスト
  context "商品保存できない" do
    it "商品の特徴が空だと出品できない" do
      @item.itemsFeature = ""
      @item.valid?
      expect(@item.errors[:itemsFeature]).to include("can't be blank")
    end

    it "価格が空だと出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it "価格が半角数字以外だと出品できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors[:price]).to include("is not a number")
    end

    it "価格が少数の場合は出品できない" do
      @item.price = 10.5
      @item.valid?
      expect(@item.errors[:price]).to include("must be an integer")
    end

    it "価格の値が300未満の場合は出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "価格の値が9999999より大きい場合は出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "category_idが1以下の場合は出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include("must be other than 1")
    end

    it "prefecture_idが1以下の場合は出品できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("must be other than 1")
    end

    it "delivery_charge_idが1以下の場合は出品できない" do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors[:delivery_charge_id]).to include("must be other than 1")
    end

    it "status_idが1以下の場合は出品できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors[:status_id]).to include("must be other than 1")
    end

    it "schedule_idが1以下の場合は出品できない" do
      @item.schedule_id = 1
      @item.valid?
      expect(@item.errors[:schedule_id]).to include("must be other than 1")
    end

    it "ユーザーと紐づいてないと投稿できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include("must exist")
    end

    it "画像がないと出品できない" do
      @item.images.attach(io: File.open(Rails.root.join('public', 'images', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')
      @item.images.purge
      @item.valid?
      expect(@item.errors[:images]).to include("can't be blank")
    end
  end
end
