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
		@user.user_id = @user.id
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to the Skeleton Site"
			redirect_to "/users/#{@user.id}"
		else
			render 'new'
		end 
	end

	private
	def user_params
			logger.debug("#{File.basename(__FILE__)} #{__method__}")
			params.require(:user).permit(:name, :email, :password, :password_confirmation )
	end

end
