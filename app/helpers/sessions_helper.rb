module SessionsHelper

	def sign_in(user)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
	
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user

	end

	def current_user=(user)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : get user")	
		@current_user = user
	end

=begin
	def current_user
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : get token string")	

		remember_token = User.encrypt(cookies[:remember_token])
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : return token string #{remember_token}")  
		@current_user ||= User.find_by(remember_token: remember_token)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : #{@current_user.name}")  
	
		return  @current_user.nil?

	end
=end
	#
	#
	#
	def signed_in?
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
    remember_token = User.encrypt(cookies[:remember_token])
    logger.debug("********** #{File.basename(__FILE__)} #{__method__} : return token string #{remember_token}")    
		@current_user ||= User.find_by(remember_token: remember_token)

		if @current_user.nil?
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : is null? #{@current_user.nil?}")
			cookies.delete(:remember_token)
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : deleted cookie :remember_token") 
			return false		
		else
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : #{@current_user.name}")
			return true
		end
	end

end
