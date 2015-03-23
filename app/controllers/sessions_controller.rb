class SessionsController < ApplicationController

	def new
	end



	#	ログイン処理
	# @param [:session, :email, :password]
	# @return render
	def create
		logger.debug("sessions controller -- call create method")
			
		
		
		
		
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# sign in し、user#show にリダイレクトする				
			sign_in user
			redirect_to user	
					
						
		else
			# login failed. output error message
			logger.debug("sessions controller -- login failed")
			flash.now[:error] = "invalid email/password combination" 
			render 'new'			# session#new を renderする
						
		end	
	
	
	end

	def destroy
	end
end
