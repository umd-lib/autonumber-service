class ApplicationController < ActionController::Base
  before_action CASClient::Frameworks::Rails::Filter
  before_action :whitelist_cas_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def whitelist_cas_user
      render status: 403, text: 'Unauthorized' unless User.find_by cas_directory_id: session[:cas_user]
    end
end
