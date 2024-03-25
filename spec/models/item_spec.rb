require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    # @user = create(:user)
    # @category = create(:category)
    # @status = create(:status)
    # @delivery_charge = create(:delivery_charge)
    # @prefecture = create(:prefecture)
    # @schedule = create(:schedule)
    # @price = 1000
    @item = FactoryBot.build(:item )
  end


  it "is valid with valid attributes" do
    expect(@item).to be_valid
  end

  it "is invalid without a name" do
    expect(@item).not_to be_valid
  end
end
