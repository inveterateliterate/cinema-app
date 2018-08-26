class Auditorium < ApplicationRecord
	has_many :showings, dependent: :destroy
	
	validates_presence_of :capacity, :number
end
