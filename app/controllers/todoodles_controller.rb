class TodoodlesController < ApplicationController

def new
  @user = current_user
  @todoodle = @user.todoodles.build
end

def create
  @todoodle = Todoodle.new(new_todoodle_params)
  if @todoodle.save!
    flash[:notice]="Whew! Another list!"
    redirect_to root_url
  else
    flash[:notice]="Try again. Something didn't work right. :("
    redirect_to root_url
  end
end

def edit
  @todoodle = Todoodle.find(params[:id])
end


def index
  @todoodles = Todoodle.all
end

def destroy
  @todoodle = Todoodle.find(params[:id])
  @todoodle.destroy
  redirect_to root_url
end


private

def new_todoodle_params
  params.require(:todoodle).permit(:title, :description)
end


end
