class AuditoriaController < ApplicationController
  before_action :set_auditorium, only: [:show, :edit, :update, :destroy]

  # GET /auditoria
  # GET /auditoria.json
  def index
    @auditoria = Auditorium.all
    @auditoria = @auditoria.sort
  end

  # GET /auditoria/1
  # GET /auditoria/1.json
  def show
  end

  # GET /auditoria/new
  def new
    @auditorium = Auditorium.new
  end

  # GET /auditoria/1/edit
  def edit
  end

  # POST /auditoria
  # POST /auditoria.json
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

  # PATCH/PUT /auditoria/1
  # PATCH/PUT /auditoria/1.json
  def update
    @showings = @auditorium.showings
    respond_to do |format|
      if @auditorium.update(auditorium_params)
        @showings.each do |showing|
            new_seats = @auditorium.capacity - showing.show_orders.count
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

  # DELETE /auditoria/1
  # DELETE /auditoria/1.json
  def destroy
    @auditorium.destroy
    respond_to do |format|
      format.html { redirect_to auditoria_url, notice: 'Auditorium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auditorium
      @auditorium = Auditorium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auditorium_params
      params.require(:auditorium).permit(:capacity)
    end
end
