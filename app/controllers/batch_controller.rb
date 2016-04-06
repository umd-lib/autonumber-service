class BatchController < ApplicationController
  def new
  end

  def create
    quantity = batch_params[:quantity].to_i
    respond_to do |format|
      if quantity > 0
        stats = AutoNumber.create_batch(quantity, auto_number_params)
        format.html { redirect_to :batch, flash: stats }
      else
        format.html { redirect_to :batch, flash: { error: 'Quantity must be greater than 0' } }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_number_params
      params.require(:batch).permit(:entry_date, :name_id, :repository_id)
    end

    def batch_params
      params.require(:batch).permit(:quantity)
    end
end
