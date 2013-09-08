class TasksController < ApplicationController
  before_filter :signed_in_user, [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
	@task = current_user.tasks.build(params[:task])
		if @task.save
			flash[:success] = "Task created!"
			redirect_to root_url
		else
			@task_feed_items = []
			render 'static_pages/home'
		end
  end

  def destroy
  @task.destroy
  redirect_to root_url
  end
  
  private
  
  def correct_user
	@task = current_user.tasks.find_by_id(params[:id])
    redirect_to root_url if @task.nil?
  end
  
end