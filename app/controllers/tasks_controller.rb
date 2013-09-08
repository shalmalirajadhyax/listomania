class TasksController < ApplicationController
  before_filter :signed_in_user

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
  end
end