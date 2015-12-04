class TasksController < ApplicationController

def new
  @task = Task.new
  @task.completed=false
  @todoodle = Todoodle.find(params[:todoodle_id])
end

def create
  @todoodle = Todoodle.find(params[:todoodle_id])
  @task = @todoodle.tasks.new(new_task_params)
  @task.completed=false
  if @task.save
    flash[:notice]="...Another Task ToDoodle!"
    redirect_to root_url
  else
    flash[:notice]="Try again. Something didn't work right. :("
    render :new
  end

end

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  @task.update_attributes(completed:true)
  @task.save!
  flash[:notice]="That's done! Great Job!"

  redirect_to root_url
end



private

def new_task_params
  params.require(:task).permit(:item)
end


end
