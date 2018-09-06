require 'spec_helper'

RSpec.describe AuditoriaController, type: :controller do
  before(:each) do
    @auditorium = Auditorium.create(capacity: 50)
  end

  after(:each) do
    @auditorium.destroy if @auditorium.present?
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

    it 'populates an instance variable @auditoria with all auditoria in the database' do
      get :index
      expect(assigns[:auditoria]).to eq(Auditorium.all)
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

    it 'assigns an instance variable to a new auditorium' do
      get :new
      expect(assigns(:auditorium)).to be_a_new(Auditorium)
    end
  end

  describe 'POST create' do
    before(:each) do
      @auditorium_hash = { capacity: 400 }
    end

    after(:each) do
      auditorium = Auditorium.find_by_capacity(400)
      auditorium.destroy if auditorium.present?
    end

    it 'responds with a redirect' do
      post :create, auditorium: @auditorium_hash
      expect(response.redirect?).to be(true) 
    end

    it 'creates an auditorium' do
      post :create, auditorium: @auditorium_hash  
      expect(Auditorium.find_by_capacity(400).present?).to be(true)
    end

    it 'redirects to the show view' do
      post :create, auditorium: @auditorium_hash
      expect(response).to redirect_to(auditorium_url(assigns(:auditorium)))
    end

    it 'redisplays new form on error' do
      @auditorium_hash[:capacity] = nil
      post :create, auditorium: @auditorium_hash
      expect(response).to render_template(:new)
    end
    
    it 'assigns the @errors instance variable on error' do
      @auditorium_hash[:capacity] = ''
      post :create, auditorium: @auditorium_hash
      expect(assigns[:auditorium].errors.any?).to be(true)
    end 
  end

  describe 'GET edit' do
  #  before(:each) do
  #    @auditorium = Auditorium.first
  #  end

    it 'responds with success' do
      get :edit, id: @auditorium.id
      expect(response.success?).to be(true)
    end

    it 'renders the edit view' do
      get :edit, id: @auditorium.id     
      expect(response).to render_template(:edit)
    end

    it 'assigns an instance variable called @auditorium to Auditorium with the appropriate id' do
      get :edit, id: @auditorium.id
      expect(assigns(:auditorium)).to eq(@auditorium)
    end
  end

  describe 'PUT update' do
    before(:each) do
      @auditorium = Auditorium.last
      @auditorium_hash = { capacity: 500 }
    end

    it 'responds with a redirect' do
      put :update, auditorium: @auditorium_hash, id: @auditorium.id
      expect(response.redirect?).to be(true)
    end
   
    it 'updates an auditorium' do
      put :update, auditorium: @auditorium_hash, id: @auditorium.id
      @auditorium.reload
      expect(@auditorium.capacity).to eq(@auditorium_hash[:capacity])
    end
  
    it 'redirects to the show view' do
      put :update, auditorium: @auditorium_hash, id: @auditorium.id 
      @auditorium.reload
      expect(response).to redirect_to(auditorium_path(assigns(:auditorium)))
    end

    it 'assigns the @errors instance variable on error' do
      @auditorium_hash[:capacity] = ''
      put :update, auditorium: @auditorium_hash, id: @auditorium.id
      expect(assigns[:auditorium].errors.any?).to be(true)
    end

    it "re-renders the 'edit' template" do
      @auditorium_hash[:capacity] = ''
      put :update, auditorium: @auditorium_hash, id: @auditorium.id
      expect(response).to render_template(:edit)
    end
  end
end