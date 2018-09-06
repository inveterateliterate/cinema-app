class Showing < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium
  has_many :orders, dependent: :destroy
  
  validates_presence_of :showtime, :movie_id, :auditorium_id
  validates_uniqueness_of :showtime

 	before_create :update_avail_seats

  scope :by_showtime, -> { order(showtime: :asc) }

  def update_avail_seats
    update_column(:avail_seats, auditorium.capacity)
  end
end
