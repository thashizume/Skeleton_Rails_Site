module SessionsHelper
	
	#
	#
	#
	#
	def sign_in(user)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	

		token = cookies[:token]
	
#		token = Anonymous.new_token
#		cookies[token] = token


		logger.debug("********** #{File.basename(__FILE__)} #{__method__}:set cookie token#{:token}")	
=begin
		Anonymous.update_attribute(token: = Anonymous.encrypt(:token))
=end
#	TODO: 最終ログイン日も設定する必要があるのか？
		self.current_user = anonymous 
	end

	def current_user=(anonymous)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : get user")	
		@current_user = anonymous 
	end

	def current_user
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : get token string")	
		token = Anonymous.encrypt(cookies[:token])
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

		if cookies.nil?
			logger.debug("********** #{File.basename(__FILE__)} #{__method__}:cookie is null")	
			return false
		end 

		if cookies[:token].empty?
    	logger.debug("********** #{File.basename(__FILE__)} #{__method__} : cookie token is null")
			return false 
		end
    	logger.debug("********** #{File.basename(__FILE__)} #{__method__} : get cookie token string #{cookies[:token]}")
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : return token string #{token}")    
    	token = Anonymous.encrypt(cookies[:token])
	
			@current_guest ||= Anonymous.find_by(token: token)
			if @current_guest.nul?
				#cookies.delete(:token)
				# Cookieはあるが、データベースに値がない場合
				cookies[:token] = { :value => ''}
				return false
			else

				logger.debug("********** #{File.basename(__FILE__)} #{__method__} : #{@current_guest.nickname}")
				return true
			end 

	end # end of signed_in?

end
