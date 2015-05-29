# require 'kaminari'

class Admin::UsersController < ApplicationController



 # before_filter :authorize
 before_filter :restrict_access

 def show
   @user = User.find(params[:id])
 end



 def index
  @users = User.all
  # @users = @users.page(1)
  # @users = Kaminari.paginate_array(User.all).page(params[:page])
  @users =  Kaminari.paginate_array(@users).page(params[:page]).per(2)
end


def edit
  @user = User.find(params[:id])
end


protected
¡¡¡

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
