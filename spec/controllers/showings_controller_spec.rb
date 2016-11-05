require 'spec_helper'

RSpec.describe ShowingsController, type: :controller do

before(:each) do
   @showing = FactoryGirl.create(:showing)
end
after(:each) do
  if !@showing.nil?
    @showing.destroy
  end
end


describe "GET index" do
  it 'responds with success' do
    get :index
    expect(response.success?).to be(true)
  end

  	it 'renders the index template' do
      get :index
      expect(response).to render_template("index")
  	end

  	it "populates an instance variable @showings with all showings in the database" do
		  get :index
		  expect(assigns[:showings]).to eq(Showing.all.sort_by {|x| x.showtime })
	  end
end

describe "GET homepage" do
  it 'responds with success' do
    get :homepage
    expect(response.success?).to be(true)
  end

    it 'renders the homepage template' do
      get :homepage
      expect(response).to render_template("homepage")
    end

    it "populates an instance variable @date with today's date" do
      get :homepage
      expect(assigns[:date]).to eq(Date.today.strftime("%B %-d, %Y"))
    end
end

describe "GET showdates" do
  it 'responds with success' do
    get :showdates, date: (Date.today+1).strftime("%B %-d, %Y")
    expect(response.success?).to be(true)
  end

    it 'renders the showdates template' do
      get :showdates, date: (Date.today+1).strftime("%B %-d, %Y")
      expect(response).to render_template("showdates")
    end

    it "populates an instance variable @date with the selected date" do
      get :showdates, date: (Date.today+1).strftime("%B %-d, %Y")
      expect(assigns[:date]).to eq((Date.today+1).strftime("%B %-d, %Y"))
    end
end

describe "GET new" do
  it 'responds with success' do
    get :new
    expect(response.success?).to be(true)
  end

  it 'renders the new view' do
      get :new      
      expect(response).to render_template(:new)
  end

  it 'assigns an instance variable to a new showing' do
      get :new
      expect(assigns(:showing)).to be_a_new(Showing)
  end
end

describe "POST create" do
  before(:each) do
    @showing_hash = { 
        date: Date.today,
        showtime: Time.now,
        movie_id: 1,
        auditorium_id: 1,
        #avail_seats: 80
      }     
  end
  after(:each) do
    showing = Showing.find_by_movie_id(1)
    if !showing.nil?
      	showing.destroy
    end
  end

  	it 'responds with a redirect' do
    post :create, showing: @showing_hash
    expect(response.redirect?).to be(true) 
  	end

  	it 'creates a showing' do
      post :create, showing: @showing_hash  
      expect(Showing.find_by_movie_id(1).present?).to be(true)
    end


  	it 'redirects to the show view' do
      post :create, showing: @showing_hash
      expect(response).to redirect_to(showing_url(assigns[:showing]))
  	end

  	it 'redisplays new form on error' do
      @showing_hash.delete(:movie_id)
      post :create, showing: @showing_hash
      expect(response).to render_template(:new)
    end
    
    it 'assigns the @errors instance variable on error' do
       @showing_hash.delete(:movie_id)
      post :create, showing: @showing_hash
      expect(assigns[:showing].errors.any?).to be(true)
    end 
end

describe "GET edit" do
  before(:each) do
    @showing = Showing.first
  end

  it "responds with success" do
	 get :edit, id: @showing.id
	 expect(response.success?).to be(true)
  end

  it 'renders the edit view' do
      get :edit, id: @showing.id     
      expect(response).to render_template(:edit)
  end

  it "assigns an instance variable called @showing to Showing with the appropriate id" do
      get :edit, id: @showing.id
      expect(assigns(:showing)).to eq(@showing)
  end
end

describe "PUT update" do

  before(:each) do
    @showing = Showing.last
    @showing_hash = { 
        date: Date.today,
        showtime: Time.now,
        movie_id: 2,
        auditorium_id: 1,
        avail_seats: 80
      } 
  end

    it 'responds with a redirect' do
      put :update, showing: @showing_hash, id: @showing.id
      expect(response.redirect?).to be(true)
    end
   
    it 'updates a showing' do
      put :update, showing: @showing_hash, id: @showing.id
      @showing.reload
      expect(@showing.movie_id).to eq(@showing_hash[:movie_id])
    end
  
    it 'redirects to the show view' do
      put :update, showing: @showing_hash, id: @showing.id
      @showing.reload
      expect(response).to redirect_to(showing_path(assigns(:showing)))
    end

  	it 'assigns the @errors instance variable on error' do
      @showing_hash[:movie_id] = ""
      put :update, showing: @showing_hash, id: @showing.id
      expect(assigns[:showing].errors.any?).to be(true)
  	end

  	it "re-renders the 'edit' template" do
       @showing_hash[:movie_id] = ""
      put :update, showing: @showing_hash, id: @showing.id
       expect(response).to render_template(:edit)
  	end
end

end