class CreateDeliveryCharges < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_charges do |t|

      t.timestamps
    end
  end
end
