class TodoodlesController < ApplicationController

def new
  @user = current_user
  @todoodle = @user.todoodles.build
end

def create
  @todoodle = Todoodle.new(new_todoodle_params)
  @todoodle.user = current_user
  if @todoodle.save
    flash[:notice]="A New ToDoodle!"
    redirect_to root_url
  else
    flash[:notice]="Try again. Something didn't work right. :("
    render :new
  end
end

def edit
  @todoodle = Todoodle.find(params[:id])
end


def index
  @todoodles = Todoodle.all
  @user = current_user
end

def destroy
  @todoodle = Todoodle.find(params[:id])
  @todoodle.destroy
  redirect_to root_url
end


private

def new_todoodle_params
  params.require(:todoodle).permit(:title)
end


end
