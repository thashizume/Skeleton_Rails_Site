module SessionsHelper

	def sign_in(user)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
	
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user

	end

	def current_user=(user)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
		@current_user = user
	end


	def current_user
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
		remember_token = User.encrypt(cookies[:remember_token])

		@current_user ||= User.find_by(remember_token: remember_token)


	end

	def signed_in?
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
		!current_user.nil?
	end




end
