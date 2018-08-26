class ShowingsController < ApplicationController
  before_action :set_showing, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, only: [:index, :homepage, :showdates, :movie_filter, :auditorium_filter]

  def index
    @showings = Showing.all
    @showings = @showings.order(showtime: :asc)
    @auditoria = Auditorium.all.order(num: :asc)
  end

  def show
  end

  def new
    @showing = Showing.new
  end

  def edit
  end
  
  def homepage
    @date = Date.today.strftime("%B %-d, %Y")
  end

  def showdates
    @date = params[:date]
  end

  def movie_filter
    @movie = Movie.find(params[:id])
    @auditoria = Auditorium.all.sort
    @showings = @movie.showings.by_showtime
    render :movie_filtered
  end

  def auditorium_filter
    @auditoria = Auditorium.all.sort
    @auditorium = Auditorium.find(params[:id])
    @showings = @auditorium.showings
    render :auditorium_filtered
  end

  def create
    @showing = Showing.new(showing_params)
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

  def destroy
    @showing.destroy
    respond_to do |format|
      format.html { redirect_to showings_url, notice: 'Showing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_showing
    @showing = Showing.find(params[:id])
  end

  def set_movies
    @movies = Movie.all
  end

  def showing_params
    params.require(:showing).permit(:date, :showtime, :movie_id, :auditorium_id)
  end
end
