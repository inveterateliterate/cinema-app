class Order < ApplicationRecord
  belongs_to :showing

  validates_presence_of :cust_first, :cust_last, :cust_email, :sale, :cc_num, :cc_exp, :showing_id
  validates_numericality_of :cc_num, on: :create
  validates_length_of :cc_num, is: 16, message: ' is an invalid credit card number'
  validate :invalid_exp_date
  validates :cust_email, email: true

  after_save :decrease_avail_seats

  def invalid_exp_date
    unless cc_exp.nil?
      errors.add(:cc_exp, 'is in the past') if (cc_exp < Date.today)
    end
  end

  def decrease_avail_seats
    showing.update_column(:avail_seats, showing.avail_seats - 1)
  end

  def customer_name
    "#{cust_first} #{cust_last}"
  end
end
