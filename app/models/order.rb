class Order < ApplicationRecord
  validates_presence_of :cust_first, :cust_last, :cust_email, :sale, :cc_num, :cc_exp
  belongs_to :showing
end
