class ShowingsController < ApplicationController
  before_action :set_showing, only: [:show, :edit, :update, :destroy]
  # GET /showings
  # GET /showings.json
  def index
    @showings = Showing.all
    @showings = @showings.sort_by {|x| x.showtime }
  end

  # GET /showings/1
  # GET /showings/1.json
  def show
  end

  # GET /showings/new
  def new
    @showing = Showing.new
    @date = Date.today
  end

  # GET /showings/1/edit
  def edit
    @date = Date.today
  end

  def homepage
    @movies = Movie.all
    @dates = date_list
    @date = Date.today.strftime("%B %-d, %Y")
  end

  def showdates
    @date = params[:date]
    @movies = Movie.all
    @dates = date_list
  end

  # POST /showings
  # POST /showings.json
  def create
    @showing = Showing.new(showing_params)
    @date = Date.today
    respond_to do |format|
      if @showing.save
        format.html { redirect_to @showing, notice: 'Showing was successfully created.' }
        format.json { render :index, status: :created, location: @showing }
      else
        format.html { render :new }
        format.json { render json: @showing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showings/1
  # PATCH/PUT /showings/1.json
  def update
    respond_to do |format|
      if @showing.update(showing_params)
        format.html { redirect_to @showing, notice: 'Showing was successfully updated.' }
        format.json { render :show, status: :ok, location: @showing }
      else
        format.html { render :edit }
        format.json { render json: @showing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showings/1
  # DELETE /showings/1.json
  def destroy
    @showing.destroy
    respond_to do |format|
      format.html { redirect_to showings_url, notice: 'Showing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showing
      @showing = Showing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def showing_params
      params.require(:showing).permit(:date, :showtime, :movie_id, :auditorium_id)
    end
end
