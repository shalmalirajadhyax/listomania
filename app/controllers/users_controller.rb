require 'will_paginate/array'
class UsersController < ApplicationController


before_filter :signed_in_user, only: [:edit, :update]
before_filter :correct_user, only: [:edit, :update]

  def new
	@user = User.new
  end
  
  def create
	@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Listomania!"
			redirect_to @user
		else
			render 'new'
		end
  end
 

  def show
	@user = User.find(params[:id])
	@tasks = @user.tasks.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
	#@user.tasks.find_by_user_id(params[:id]).paginate(:per_page => 5, :page => params[:page])
	
	
	respond_to do |format|
	format.html
	format.xml {render :xml => @user.tasks } #rendering XML
	
	end
  end
  
  def edit
	@user = User.find(params[:id])
  end
  
  def update
	@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Your Profile has been updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end
 
  def destroy
	reset_session
	User.find(params[:id]).destroy
	flash[:success] = "Profile deleted!"
	redirect_to root_url
  end
	
	private
	
	def correct_user
		@user = User.find (params[:id])
		redirect_to '/root_path' unless current_user? (@user) 
	end
end
