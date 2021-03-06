module SessionsHelper
	
	def log_in(user)
		session[:user_id] = user.id
	end
	
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def is_logged
		!current_user.nil?
	end

	def is_admin
		is_logged && current_user.admin
	end

	
	def log_out
		@current_user = nil
		session.delete(:user_id)
	end
end
