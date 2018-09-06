FactoryBot.define do
  factory :showing do
    date { Date.today }
    sequence(:showtime) { |n| Time.now + n }
    movie
    auditorium
  end
end