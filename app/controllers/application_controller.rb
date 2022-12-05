class ApplicationController < ActionController::Base
  #set current user from the pc ip address
  def current_user
    @current_user = request.remote_ip.to_s.gsub(/[^0-9A-Za-z]/, '').to_i
  end
end
