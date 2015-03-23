class SessionsController < ApplicationController

	def new
	end



	#	ログイン処理
	# @param [:session, :email, :password]
	# @return render
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# sign in し、user#show にリダイレクトする				
					
					
						
		else
			# login failed. output error message
			flash[:error] = "invalid email/password combination" 
			render 'new'			# session#new を renderする
						
		end	
	
	
	end

	def destroy
	end
end
