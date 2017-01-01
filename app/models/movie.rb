class Movie < ApplicationRecord

	validates_presence_of :title, :runtime, :description, :rating
	has_many :showings, dependent: :destroy

	has_attached_file :image, style: { medium: "300x300", thumb: "60x60" }, default_url: "https://pixabay.com/static/uploads/photo/2015/11/16/17/39/clouds-1046109_960_720.jpg"
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	def showings
  		movie_showings = Showing.where("movie_id=?", self.id)
      movie_showings.sort_by {|x| x.showtime }
  	end

  	def orders
  		movie_orders = []
      if !self.showings.empty?
  		self.showings.each do |showing|
  			order = Order.where("showing_id=?", showing.id)
        if !order.nil?
          order.each do |x|
           movie_orders.push(x)
          end
        end
  		end
    end
  		movie_orders
  	end

end
