FactoryBot.define do
  factory :auditorium do
    capacity { 40 }
    number { Faker::Number.number(1) }
  end
end