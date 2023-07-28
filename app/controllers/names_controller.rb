class NamesController < ApplicationController
  before_action :set_name, only: [:show, :edit, :update, :destroy]

  # GET /names
  # GET /names.json
  def index
    @q = Name.ransack(params[:q])
    @q.sorts = 'initials asc' if @q.sorts.empty?
    @names = @q.result.page(params[:page])
  end

  # GET /names/1
  # GET /names/1.json
  def show
  end

  # GET /names/new
  def new
    @name = Name.new
  end

  # GET /names/1/edit
  def edit
  end

  # POST /names
  # POST /names.json
  def create
    @name = Name.new(name_params)

    respond_to do |format|
      if @name.save
        format.html { redirect_to @name, notice: 'Name was successfully created.' }
        format.json { render :show, status: :created, location: @name }
      else
        format.html { render :new }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /names/1
  # PATCH/PUT /names/1.json
  def update
    respond_to do |format|
      if @name.update(name_params)
        format.html { redirect_to @name, notice: 'Name was successfully updated.' }
        format.json { render :show, status: :ok, location: @name }
      else
        format.html { render :edit }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.json
  def destroy
    respond_to do |format|
      if delete
        format.html { redirect_to names_url, notice: 'Name was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to names_url, flash: { error: @error_msg } }
        format.json { render json: [error], status: :unprocessable_entity }
      end
    end
  end

  private

    def delete
      @name.destroy
      true
    rescue ActiveRecord::DeleteRestrictionError
      @error_msg = 'Name cannot be removed because it has associated Autonumbers'
      false
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_name
      @name = Name.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_params
      allowed = params.require(:name).permit(:initials)
      # force initials to lowercase
      allowed[:initials].downcase!
      allowed
    end
end
