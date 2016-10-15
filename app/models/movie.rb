class Movie < ApplicationRecord

	validates_presence_of :title, :runtime, :description, :rating
	has_many :showings

	has_attached_file :image, style: { medium: "300x300", thumb: "60x60" }, default_url: "https://pixabay.com/static/uploads/photo/2015/11/16/17/39/clouds-1046109_960_720.jpg"
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	def showings
  		Showing.where("movie_id=?", self.id)
  	end

  	def orders
  		movie_orders = []
  		self.showings.each do |showing|
  			movie_orders.push(Order.where("showing_id=?", showing.id))
  		end
  		movie_orders
  	end

end
