class ChangeDatatypeInOrders < ActiveRecord::Migration[5.0]
  def change

  		remove_column :orders, :cc_num, :integer
  		add_column :orders, :cc_num, :bigint

  		remove_column :orders, :sale, :integer
  		add_column :orders, :sale, :float
  end
end
