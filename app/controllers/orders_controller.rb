class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  def index
    @orders = Order.all
    @movies = Movie.all
  end

  def show
    @showing = @order.showing
    @movie = @showing.movie
  end

  def filter
    @movie = Movie.find(params[:id])
    @orders = @movie.orders
    @movies = Movie.all
    render :filtered
  end

  def new
    @order = Order.new
    @showing = Showing.find(params[:showing])
    @movie = Movie.find(@showing.movie_id)
    @price = 8.00
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @showing = @order.showing
    @movie = @showing.movie
    @price = 8.00
    respond_to do |format|
      if @order.save
        OrderMailer.order_receipt(@order).deliver_now
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:cust_last, :cust_first, :cust_email, :showing_id, :cc_num, :cc_exp, :sale)
  end
end
