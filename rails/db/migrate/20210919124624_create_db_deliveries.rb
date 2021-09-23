class CreateDbDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :db_deliveries, id: :uuid do |t|
      t.datetime :delivered_at
      t.datetime :started_at
      t.references :db_delivery_man, null: false, foreign_key: true, type: :uuid
      t.references :db_customer, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
