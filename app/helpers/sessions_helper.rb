module SessionsHelper
	def sign_in (user)
		#cookies.permanent[:remember_token] = user.remember_token
		
		session[:user_id] = user.id
		self.current_user = user
	end
	
	def current_user=(user)
		@current_user = user
	end
	
	def current_user
		#@current_user ||= User.find_by_remember_token(cookies[:remember_token])
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	def signed_in?
		!current_user.nil?
	end
	
	def sign_out
		session[:user_id] = nil
		self.current_user = nil
#<<<<<<< HEAD
		#@current_user = nil
		#cookies.delete(:remember_token)
		#reset_session
		#redirect_to root_url
		
#=======
		#current_user = nil
		#cookies.delete(:remember_token)
		#redirect_to root_url
#>>>>>>> 7a7ea20bb947b2d6d148010c6608cc7514fd39f8
	end
	
	def current_user? (user)
		user == current_user
	end
	
	def store_location
		session[:return_to] = request.url
	end
	
	def redirect_back_or (default)
		redirect_to (session[:return_to] || default)
		session.delete(:return_to)
	end
	
	def signed_in_user
		unless signed_in?
			store_location
			redirect_to 'login', notice: "Please sign in" #changed from signin_path to login
		end
	end
end
