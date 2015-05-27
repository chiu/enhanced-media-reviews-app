class Admin::UsersController < ApplicationController



 # before_filter :authorize
 before_filter :restrict_access




 def index
  @users = User.all
end


protected


def authorize_admin
  if current_user.admin
   current_user.admin 
 end
end

def restrict_access
  if !authorize_admin
    flash[:alert] = "You must be admin."
    redirect_to new_session_path
  end
end


end
