require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:status) { create(:status) }
  let(:delivery_charge) { create(:delivery_charge) }
  let(:prefecture) { create(:prefecture) }
  let(:schedule) { create(:schedule) }

  it "is valid with valid attributes" do
    item = build(:item, user: user, category: category, status: status, delivery_charge: delivery_charge, prefecture: prefecture, schedule: schedule)
    expect(item).to be_valid
  end

  it "is invalid without a name" do
    item = build(:item, itemsName: nil, user: user, category: category, status: status, delivery_charge: delivery_charge, prefecture: prefecture, schedule: schedule)
    expect(item).not_to be_valid
  end
end
