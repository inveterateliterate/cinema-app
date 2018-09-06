FactoryBot.define do
  factory :order do
    cust_last { Faker::Name.last_name }
    cust_first { Faker::Name.first_name }
    cust_email { Faker::Internet.email }
    cc_num { Faker::Business.credit_card_number }
    cc_exp { Faker::Business.credit_card_expiry_date }
    sale { 8.00 }
    showing
  end
end