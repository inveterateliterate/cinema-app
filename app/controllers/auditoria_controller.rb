class AuditoriaController < ApplicationController
  before_action :set_auditorium, only: [:show, :edit, :update, :destroy]

  def index
    @auditoria = Auditorium.order(num: :asc)
  end

  def show
  end

  def new
    @auditorium = Auditorium.new
  end

  def edit
  end

  def create
    @auditorium = Auditorium.new(auditorium_params)

    respond_to do |format|
      if @auditorium.save
        format.html { redirect_to @auditorium, notice: 'Auditorium was successfully created.' }
        format.json { render :show, status: :created, location: @auditorium }
      else
        format.html { render :new }
        format.json { render json: @auditorium.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @showings = @auditorium.showings.by_showtime
    respond_to do |format|
      if @auditorium.update(auditorium_params)
        @showings.each do |showing|
            new_seats = @auditorium.capacity - showing.orders.count
            showing.update_column(:avail_seats, new_seats)
        end
        format.html { redirect_to @auditorium, notice: 'Auditorium was successfully updated.' }
        format.json { render :show, status: :ok, location: @auditorium }
      else
        format.html { render :edit }
        format.json { render json: @auditorium.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auditorium.destroy
    respond_to do |format|
      format.html { redirect_to auditoria_url, notice: 'Auditorium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_auditorium
    @auditorium = Auditorium.find(params[:id])
  end

  def auditorium_params
    params.require(:auditorium).permit(:capacity, :number)
  end
end
