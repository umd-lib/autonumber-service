class BatchController < ApplicationController
  def new
  end

  def create
    respond_to do |format|
      errors = check_params
      if errors.empty?
        stats = AutoNumber.create_batch(quantity, auto_number_params)
        format.html { redirect_to :batch, flash: stats }
      else
        format.html { redirect_to :batch, flash: { errors: errors } }
      end
    end
  end

  private

    def check_params
      errors = []
      errors.push('Quantity must be greater than 0') unless quantity > 0
      errors.push('Name is required') if auto_number_params[:name_id].nil?
      errors.push('Repository is required') if auto_number_params[:repository_id].nil?
      errors
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_number_params
      params.require(:batch).permit(:entry_date, :name_id, :repository_id)
    end

    def quantity
      params.require(:batch).permit(:quantity)[:quantity].to_i
    end
end
