FactoryBot.define do
  factory :movie do
    title { 'Princess Bride' } 
    runtime { 125 }
    description { 'Great movie!' }
    rating { 'PG' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/rails-logo-thumbnail.png'), 'image/png') }
  end
end