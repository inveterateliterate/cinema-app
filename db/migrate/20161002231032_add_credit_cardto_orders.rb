class AddCreditCardtoOrders < ActiveRecord::Migration[5.0]
  def change
  		add_column :orders, :cc_num, :integer
  		add_column :orders, :cc_exp, :date
  end
end
