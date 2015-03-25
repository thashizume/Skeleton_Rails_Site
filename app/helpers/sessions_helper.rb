module SessionsHelper
	
	#
	#
	#
	#
	def sign_in(user)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
	
		token = Anonymous.new_token
		cookies[:token] = token
		Anonymous.update_attribute(:token = Anonymous.encrypt(token))
		self.current_user = anonymous 
	end

	def current_user=(anonymous)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : get user")	
		@current_user = anonymous 
	end

	def current_user
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : get token string")	
		token = Anonymous.encrypt(cookies[:remember_token])
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : return token string #{token}")  
		@current_user ||=Anonymous.find_by(token: token)
	end

	def current_user?(anonymous)
		user == current_user
	end

	#
	#
	#
	def signed_in?
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
    token = Anonymous.encrypt(cookies[:remember_token])
    logger.debug("********** #{File.basename(__FILE__)} #{__method__} : return token string #{token}")    
		@current_guest ||= Anonymous.find_by(token: token)

		if @current_guest.nil?
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : is null? #{@current_guest.nil?}")
			#cookies.delete(:remember_token)
			cookies[:token] = { :value => ''}
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : deleted cookie :token") 
			return false		
		else
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : #{@current_guest.nickname}")
			return true
		end
	end

end
