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
      errors.push('Name is required') if batch_params[:name_initials].blank?
      errors.push('Repository is required') if batch_params[:repository_name].blank?
      errors
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      params.require(:batch).permit(:entry_date, :name_initials, :repository_name)
    end

    def auto_number_params
      batch_params.reject { |key| %w(name_initials repository_name).include?(key) }.merge(
        repository: Repository.find_or_create_by(name: batch_params[:repository_name].downcase),
        name: Name.find_or_create_by(initials: batch_params[:name_initials].downcase)
      )
    end

    def quantity
      params.require(:batch).permit(:quantity)[:quantity].to_i
    end
end
