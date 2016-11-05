class Order < ApplicationRecord
  validates_presence_of :cust_first, :cust_last, :cust_email, :sale, :cc_num, :cc_exp, :showing_id
  validates_numericality_of :cc_num, :on => :create
  validates_length_of :cc_num, :is => 16, :message => " is an invalid credit card number"
  validate :invalid_exp_date
  validates :cust_email, email: true
  belongs_to :showing

  after_save :decrease_avail_seats



  def invalid_exp_date
    if (!cc_exp.nil?)
      if (cc_exp < Date.today)
        errors.add(:cc_exp, "is in the past")
  	 end
    end
  end

  def decrease_avail_seats
    showing = Showing.find(self.showing_id)
    showing.update_column(:avail_seats, showing.avail_seats - 1)
  end


end
