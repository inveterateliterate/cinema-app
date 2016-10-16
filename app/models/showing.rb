class Showing < ApplicationRecord
  validates_presence_of :date, :showtime, :movie_id, :auditorium_id
  validates_uniqueness_of :showtime
  belongs_to :movie
  belongs_to :auditorium
  has_many :orders, dependent: :destroy

 	after_save :update_avail_seats


	def show_orders
      	Order.where("showing_id=?", self.id)
  end

  def update_avail_seats
  		auditorium = Auditorium.find(self.auditorium_id)
  		seats = auditorium.capacity
  		self.update_column(:avail_seats, seats)
  end
  

end
