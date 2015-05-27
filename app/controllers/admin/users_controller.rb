class Admin::UsersController < ApplicationController



# before_filter :authorize

def index
  @users = User.all
end


end
