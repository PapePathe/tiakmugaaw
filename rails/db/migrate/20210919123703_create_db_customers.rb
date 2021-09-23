class CreateDbCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :db_customers, id: :uuid do |t|
      t.string :name
      t.string :phone_number, limit: 15
      t.string :password_digest

      t.timestamps
    end
    add_index :db_customers, :phone_number, unique: true
  end
end
