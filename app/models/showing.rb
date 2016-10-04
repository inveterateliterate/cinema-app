class Showing < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium
  has_many :orders


	def show_orders
      	Order.where("showing_id=?", self.id)
  	end
  

end
