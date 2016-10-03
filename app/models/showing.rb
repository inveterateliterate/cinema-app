class Showing < ApplicationRecord
  belongs_to :movie
  belongs_to :auditorium
  has_many :orders



  

end
