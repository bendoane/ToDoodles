class UsersController < ApplicationController

def index
  @todoodles=Todoodles.all
end

def new
  @user=User.new
end

def create
  @user = User.new(newguy_params)
  if @user.save
    flash[:notice]="Great Job! Let's make some lists!"
    redirect_to root_url
  else
    flash[:notice]="Hm. Something went wrong. Try again"
    redirect_to new_user_path
  end

end

private

def newguy_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation)
end



end
