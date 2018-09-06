require 'spec_helper'

RSpec.describe Showing, type: :model do
  before(:all) do
    @auditorium = Auditorium.create(capacity: 40)
    @movie = Movie.create(title: 'Princess Bride', runtime: 125, description: 'Great movie!', rating: 'PG', image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/rails-logo-thumbnail.png'), 'image/png')) 		
  end
 
  after(:all) do
 	  unless @showing.destroyed?
      @showing.destroy
      @auditorium.destroy
      @movie.destroy	
    end
  end
 
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:showtime) }
  it { should validate_presence_of(:movie_id) }
  it { should validate_presence_of(:auditorium_id) }
  it { should validate_uniqueness_of(:showtime) }

  it 'updates available seats after save' do
    @showing = Showing.create(date: Date.today, showtime: Time.now + 1, movie_id: @movie.id, auditorium_id: @auditorium.id)
    expect(@showing.avail_seats).to eq(@auditorium.capacity) 		
  end
end