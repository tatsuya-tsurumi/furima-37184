class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :products, null: false
      t.text :products_explanation, null: false
      t.integer :category_id, null: false
      t.integer :state_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :region_id, null: false
      t.integer :shipping_date_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
