class Auditorium < ApplicationRecord

	validates_presence_of :capacity
	has_many :showings, dependent: :destroy

	def showings
  		auditorium_showings = Showing.where("auditorium_id=?", self.id)
      	auditorium_showings.sort_by {|x| x.showtime }
  	end
end
