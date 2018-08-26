require 'spec_helper'

RSpec.describe MoviesController, type: :controller do

  before(:each) do
     @movie = FactoryGirl.create(:movie)
  end

  after(:each) do
    @movie.destroy if @movie.present?
  end

  describe 'GET index' do
    it 'responds with success' do
      get :index
      expect(response.success?).to be(true)
    end

  	it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
  	end

  	it 'populates an instance variable @movie with all movie in the database' do
  		get :index
  		expect(assigns[:movies]).to eq(Movie.all)
  	end
  end

  describe 'GET new' do
    it 'responds with success' do
      get :new
      expect(response.success?).to be(true)
    end

    it 'renders the new view' do
      get :new      
      expect(response).to render_template(:new)
    end

    it 'assigns an instance variable to a new movie' do
      get :new
      expect(assigns(:movie)).to be_a_new(Movie)
    end
  end

  describe 'POST create' do
    before(:each) do
      @movie_hash = { 
        title: 'Princess Bride', 
        runtime: 125,
        description: 'Great movie!',
        rating: 'PG',
        image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/blue-sky.jpg'), 'image/png')
      }     
    end

    after(:each) do
      movie = Movie.find_by_title('Princess Bride')
      movie.destroy if movie.present?
    end

  	it 'responds with a redirect' do
      post :create, movie: @movie_hash
      expect(response.redirect?).to be(true) 
  	end

  	it 'creates an movie' do
      post :create, movie: @movie_hash  
      expect(Movie.find_by_title('Princess Bride').present?).to be(true)
    end

  	it 'redirects to the show view' do
      post :create, movie: @movie_hash
      expect(response).to redirect_to(movie_url(assigns[:movie]))
  	end

  	it 'redisplays new form on error' do
      @movie_hash.delete(:title)
      post :create, movie: @movie_hash
      expect(response).to render_template(:new)
    end
    
    it 'assigns the @errors instance variable on error' do
      @movie_hash.delete(:title)
      post :create, movie: @movie_hash
      expect(assigns[:movie].errors.any?).to be(true)
    end 
  end

  describe 'GET edit' do
    before(:each) do
      @movie = Movie.first
    end

    it 'responds with success' do
  	  get :edit, id: @movie.id
  	  expect(response.success?).to be(true)
    end

    it 'renders the edit view' do
      get :edit, id: @movie.id     
      expect(response).to render_template(:edit)
    end

    it 'assigns an instance variable called @movie to Movie with the appropriate id' do
      get :edit, id: @movie.id
      expect(assigns(:movie)).to eq(@movie)
    end
  end

  describe 'PUT update' do
    before(:each) do
      @movie = Movie.last
      @movie_hash = { 
        title: 'Princess Bride', 
        runtime: 125,
        descrition: 'Great movie!',
        rating: 'PG',
        image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/blue-sky.jpg'), 'image/png')
      }   
    end

    it 'responds with a redirect' do
      put :update, movie: @movie_hash, id: @movie.id
      expect(response.redirect?).to be(true)
    end
   
    it 'updates an movie' do
      put :update, movie: @movie_hash, id: @movie.id
      @movie.reload
      expect(@movie.title).to eq(@movie_hash[:title])
    end
  
    it 'redirects to the show view' do
      put :update, movie: @movie_hash, id: @movie.id
      @movie.reload
      expect(response).to redirect_to(movie_path(assigns(:movie)))
    end

  	it 'assigns the @errors instance variable on error' do
      @movie_hash[:title] = ''
      put :update, movie: @movie_hash, id: @movie.id
      expect(assigns[:movie].errors.any?).to be(true)
  	end

  	it "re-renders the 'edit' template" do
       @movie_hash[:title] = ''
      put :update, movie: @movie_hash, id: @movie.id
       expect(response).to render_template(:edit)
  	end
  end
end