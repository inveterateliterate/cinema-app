class AddMovieReftoOrders < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :movie, index: true
  	add_foreign_key :orders, :movies
  end

  
end
