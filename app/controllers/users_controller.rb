class UsersController < ApplicationController
  def new
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@user = User.new
  end

	def show
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@user = User.find(params[:id])
	end

	def create
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@user = User.new(user_params)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__} : Token #{@user.remember_token}")
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the Skeleton Site"
			redirect_to "/users/#{@user.id}"
		else
			render 'new'
		end 
	end

	def edit
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@user = User.find(params[:id])
	end 


	def update
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile Updated"
			redirect_to @user

		else
			render 'edit'
		end

	end



	private
		def user_params
			logger.debug("#{File.basename(__FILE__)} #{__method__}")
			params.require(:user).permit(:name, :email, :password, :password_confirmation )
		end

		def signed_in_user
			unless signed_in?
				flash[:notice] = "Please sign in."
				redirect_to signin_url
			end
		end

		def correct_user
			@user = User.find(params[:id])
			unless current_user?(@user)
				redirect_to root_path
			end
		end

end
