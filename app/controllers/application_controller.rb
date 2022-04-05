class ApplicationController < ActionController::Base
   # TODO: Uncomment this when done testing or in production, comment when testing
    before_action :authenticate_admin!
   # TODO: Add "skip_before_filter :authenticate_user!" to the top of the controller file 
   # of whichever new controller will only display projects(user side)
end
