class Movie < ApplicationRecord

	validates_presence_of :title, :runtime, :description, :rating

	has_many :showings
end
