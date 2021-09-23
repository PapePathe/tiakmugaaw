class CreateDbDeliveryMen < ActiveRecord::Migration[7.0]
  def change
    create_table :db_delivery_men, id: :uuid do |t|
      t.string :first_name, limit: 20
      t.string :last_name, limit: 20
      t.string :phone_number, limit: 15
      t.string :identifier, limit: 5
      t.string :password_digest

      t.timestamps
    end
    add_index :db_delivery_men, :phone_number, unique: true
    add_index :db_delivery_men, :identifier, unique: true
  end
end
