FactoryGirl.define do 
	factory :auditorium do
		capacity 40
	end

	factory :movie do
		title "Princess Bride" 
        runtime 125
        description "Great movie!"
        rating 'PG'
        image Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/rails-logo-thumbnail.png'), 'image/png')
    end

    factory :showing do
        date Date.today
        sequence (:showtime) { |n| Time.now + n}
        movie
        auditorium
    end

    factory :order do
        cust_last "Smith"
        cust_first "John"
        cust_email "clearviewcinemas16@gmail.com"
        cc_num 1234567891011121
        cc_exp Date.today+1
        sale 8.00
        showing
    end
end