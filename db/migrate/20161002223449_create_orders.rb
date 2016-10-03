class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :cust_last
      t.string :cust_first
      t.string :cust_email
      t.integer :sale
      t.references :showing, foreign_key: true

      t.timestamps
    end
  end
end
