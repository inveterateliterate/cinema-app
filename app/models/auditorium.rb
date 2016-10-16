class Auditorium < ApplicationRecord

	validates_presence_of :capacity
	has_many :showings, dependent: :destroy
end
