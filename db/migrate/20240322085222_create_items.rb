class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :itemsName,           null:false
      t.text :itemsFeature,          null:false
      t.integer :category_id,        null:false
      t.integer :price,              null:false
      t.integer :status_id,          null:false
      t.integer :delivery_charge_id, null:false
      t.integer :prefecture_id,      null:false
      t.integer :schedule_id,        null:false
      t.references :user,            null:false , foreign_key: true
      t.timestamps
    end
  end
end
