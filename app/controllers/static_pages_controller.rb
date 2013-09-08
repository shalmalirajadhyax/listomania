class StaticPagesController < ApplicationController
  def home
	if signed_in?
		@task = current_user.tasks
		@task_feed_items = current_user.task_feed
	end
  end
  
  
end
