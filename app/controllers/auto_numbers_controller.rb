class AutoNumbersController < ApplicationController
  before_action :set_auto_number, only: [:show, :edit, :update, :destroy]

  # GET /auto_numbers
  # GET /auto_numbers.json
  def index
    @auto_numbers = AutoNumber.all
  end

  # GET /auto_numbers/1
  # GET /auto_numbers/1.json
  def show
  end

  # GET /auto_numbers/new
  def new
    @auto_number = AutoNumber.new
  end

  # GET /auto_numbers/1/edit
  def edit
  end

  # POST /auto_numbers
  # POST /auto_numbers.json
  def create
    @auto_number = AutoNumber.new(auto_number_params)

    respond_to do |format|
      if @auto_number.save
        format.html { redirect_to @auto_number, notice: 'Auto number was successfully created.' }
        format.json { render :show, status: :created, location: @auto_number }
      else
        format.html { render :new }
        format.json { render json: @auto_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auto_numbers/1
  # PATCH/PUT /auto_numbers/1.json
  def update
    respond_to do |format|
      if @auto_number.update(auto_number_params)
        format.html { redirect_to @auto_number, notice: 'Auto number was successfully updated.' }
        format.json { render :show, status: :ok, location: @auto_number }
      else
        format.html { render :edit }
        format.json { render json: @auto_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_numbers/1
  # DELETE /auto_numbers/1.json
  def destroy
    @auto_number.destroy
    respond_to do |format|
      format.html { redirect_to auto_numbers_url, notice: 'Auto number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_number
      @auto_number = AutoNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_number_params
      params.require(:auto_number).permit(:entry_date, :name_id, :repository_id)
    end
end
