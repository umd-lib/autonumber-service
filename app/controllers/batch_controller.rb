class BatchController < ApplicationController
  def new
  end

  def create
    quantity = batch_params[:quantity].to_i
    range = get_range(create_numbers(quantity, auto_number_params))
    respond_to do |format|
      format.html { redirect_to :batch, notice: 'Created ' + quantity.to_s + ' new numbers ' + range }
    end
  end

  private

    def create_numbers(quantity, parameters)
      file_names = []
      quantity.times do
        auto_number = AutoNumber.new(parameters)
        auto_number.save
        file_names.push auto_number.file_name
      end
      file_names
    end

    def get_range(file_names)
      range = '(' + file_names.first
      range += ' to ' + file_names.last if file_names.count > 1
      range += ')'
      range
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_number_params
      params.require(:batch).permit(:entry_date, :name_id, :repository_id)
    end

    def batch_params
      params.require(:batch).permit(:quantity)
    end
end
