class SessionsController < ApplicationController

  def create
    # puts "------------------------------"
    # puts params.inspect
    @user = User.find_by_uname(params[:session][:uname])
   if @user && @user.password == params[:session][:password]
     session[:user_id] = @user.id
     puts "Hello World"

     redirect_to new_place_path
   else
     flash[:danger] = "Your email or password does not match"
     redirect_to sessions_path
    end
  end

 def destroy
   session[:user_id] = nil
   redirect_to sessions_path
 end

end
