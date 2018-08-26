class Showing < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium
  has_many :orders, dependent: :destroy
  
  validates_presence_of :date, :showtime, :movie_id, :auditorium_id
  validates_uniqueness_of :showtime

 	after_save :update_avail_seats

  scope :by_showtime, -> { order(showtime: :asc) }

  def update_avail_seats
  	auditorium = Auditorium.find(auditorium_id)
  	seats = auditorium.capacity
  	self.update_column(:avail_seats, seats)
  end
end
