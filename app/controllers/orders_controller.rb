class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @movies = Movie.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @showing = Showing.find(@order.showing_id)
    @movie = Movie.find(@showing.movie_id)
  end

  def filter
    @movie = Movie.find(params[:id])
    @orders = @movie.orders
    @movies = Movie.all
    render :filtered
  end

  # GET /orders/new
  def new
    @order = Order.new
    @showing = Showing.find(params[:showing])
    @movie = Movie.find(@showing.movie_id)
    @price = 8.00
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @showing = Showing.find(@order.showing_id)
    @movie = Movie.find(@showing.movie_id)
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

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
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

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cust_last, :cust_first, :cust_email, :showing_id, :cc_num, :cc_exp, :sale)
    end
end
