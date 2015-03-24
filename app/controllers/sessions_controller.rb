class SessionsController < ApplicationController

	def new
#		logger.debug("*********** #{File.basename(__FILE__)} #{__method__}")
	end

	#	ログイン処理
	# @param [:session, :email, :password]
	# @return render
	def create
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}:param=#{params}")
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}:email=#{params[:sessions][:email]}")
		@user = User.find_by(email: params[:sessions][:email].downcase)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} #{params[:sessions][:email].downcase}")
		if @user && @user.authenticate(params[:sessions][:password])
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

	def sign_out
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def destroy
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		sign_out
		redirect_to root_path	
	end
end
