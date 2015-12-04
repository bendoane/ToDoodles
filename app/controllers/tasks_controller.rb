class TasksController < ApplicationController

def new
  @task = Task.new
  @todoodle = Todoodle.find(params[:todoodle_id])
end

def create
  @todoodle = Todoodle.find(params[:todoodle_id])
  @task = @todoodle.tasks.new(new_task_params)
  if @task.save!
    redirect_to root_url
  else
    flash[:notice]="Try again. Something didn't work right. :("
    redirect_to root_url
  end

end

def edit
  @task = Task.find(params[:id])
end

private

def new_task_params
  params.require(:task).permit(:item)
end


end
