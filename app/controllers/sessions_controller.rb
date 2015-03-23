class SessionsController < ApplicationController

	def new
		logger.debug("*********** #{File.basename(__FILE__)} #{__method__}")
	end

	#	ログイン処理
	# @param [:session, :email, :password]
	# @return render
	def create
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@user = User.find_by(email: params[:session][:email].downcase)
		
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} #{params[:session][:email].downcase}")
		
		if @user && @user.authenticate(params[:session][:password])
			# sign in し、user#show にリダイレクトする				
			sign_in @user
			redirect_to @user	
					
						
		else
			# login failed. output error message
			logger.debug("********** #{File.basename(__FILE__)} #{__method__} : Login failed")
			flash.now[:error] = "invalid email/password combination" 
			render 'new'			# session#new を renderする
						
		end	
	
	
	end

	def destroy
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
	end
end
