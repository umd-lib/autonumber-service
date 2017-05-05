class AutocompleteController < ApplicationController
  def names
    render json: Name.where('initials LIKE ?', "#{params[:term].downcase}%").map(&:initials)
  end

  def repositories
    render json: Repository.where('name LIKE ?', "#{params[:term].downcase}%").map(&:name)
  end
end
