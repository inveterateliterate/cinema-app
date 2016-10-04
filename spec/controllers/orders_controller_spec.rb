require 'spec_helper'

RSpec.describe OrdersController, type: :controller do

before(:each) do
   @order = Order.first
end
after(:each) do
  if !@order.nil?
    @order.destroy
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

  	it "populates an instance variable @orders with all orders in the database" do
		get :index
		expect(assigns[:orders]).to eq(Order.all)
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

  it 'assigns an instance variable to a new auditorium' do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
  end
end

describe "POST create" do
  before(:each) do
    @order_hash = { 
        cust_first: "Suzy",
        cust_last: "Q",
        cust_email: "suzyq@gmail.com",
        showing_id: 1,
        cc_num: 1234567891011121,
        cc_exp: 10/5/2016
      }     
  end
  after(:each) do
    order = Order.find_by_email("suzyq@gmail.com")
    if !order.nil?
      	order.destroy
    end
  end

  	it 'responds with a redirect' do
    post :create, order: @order_hash
    expect(response.redirect?).to be(true) 
  	end

  	it 'creates an auditorium' do
      post :create, order: @order_hash  
      expect(Order.find_by_email("suzyq@gmail.com").present?).to be(true)
    end


  	it 'redirects to the show view' do
      post :create, order: @order_hash
      expect(response).to redirect_to(order_url(assigns[:order]))
  	end

  	it 'redisplays new form on error' do
      @order_hash.delete(:cust_first)
      post :create, order: @order_hash
      expect(response).to render_template(:new)
    end
    
    it 'assigns the @errors instance variable on error' do
       @order_hash.delete(:cust_first)
      post :create, order: @order_hash
      expect(assigns[:error].present?).to be(true)
    end 
end

describe "GET edit" do
  before(:each) do
    @order = Order.first
  end

  it "responds with success" do
	 get :edit, id: @order.id
	 expect(response.success?).to be(true)
  end

  it 'renders the edit view' do
      get :edit, id: @order.id     
      expect(response).to render_template(:edit)
  end

  it "assigns an instance variable called @order to Order with the appropriate id" do
      get :edit, id: @order.id
      expect(assigns(:order)).to eq(@order)
  end
end

describe "PUT update" do

  before(:each) do
    @order = Order.last
    @order_hash = { 
        cust_first: "Suzy",
        cust_last: "Q",
        cust_email: "suzyq@gmail.com",
        showing_id: 1,
        cc_num: 1234567891011121,
        cc_exp: 10/5/2016
      }  
  end

    it 'responds with a redirect' do
      put :update, order: @order_hash, id: @order.id
      expect(response.redirect?).to be(true)
    end
   
    it 'updates an auditorium' do
      put :update, order: @order_hash, id: @order.id
      @order.reload
      expect(@order.cust_first).to eq(@order_hash[:cust_first])
    end
  
    it 'redirects to the show view' do
      put :update, order: @order_hash, id: @order.id
      @order.reload
      expect(response).to redirect_to(order_path(assigns(:order)))
    end

  	it 'assigns the @errors instance variable on error' do
      @order_hash[:cust_first] = ""
      put :update, order: @order_hash, id: @order.id
      expect(assigns[:error].present?).to be(true)
  	end

  	it "re-renders the 'edit' template" do
       @order_hash[:cust_first] = ""
      put :update, order: @order_hash, id: @order.id
       expect(response).to render_template(:edit)
  	end
end

end