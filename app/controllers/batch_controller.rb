class BatchController < ApplicationController
  def new
  end

  def create
    respond_to do |format|
      errors = check_params
      if errors.empty?
        args = auto_number_params.reject { |key| %w(name_initials repository_name).include?(key) }.merge(
          repository: Repository.find_or_create_by(name: auto_number_params[:repository_name]),
          name: Name.find_or_create_by(initials: auto_number_params[:name_initials])
        )
        stats = AutoNumber.create_batch(quantity, args)
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
      errors.push('Name is required') if auto_number_params[:name_initials].blank?
      errors.push('Repository is required') if auto_number_params[:repository_name].blank?
      errors
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_number_params
      params.require(:batch).permit(:entry_date, :name_initials, :repository_name)
    end

    def quantity
      params.require(:batch).permit(:quantity)[:quantity].to_i
    end
end
