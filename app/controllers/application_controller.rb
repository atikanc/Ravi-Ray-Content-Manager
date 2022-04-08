class ApplicationController < ActionController::Base
   before_action :authenticate_admin!

   helper_method :current_admin, :logged_in?

   # get currently logged in admin (if exists) and store in @current_admin
   def current_admin
      @current_admin ||= Admin.find_by_id(session[:admin])
   end

   # check if there is a currently logged in admin
   def logged_in?
      current_admin != nil
   end
end
