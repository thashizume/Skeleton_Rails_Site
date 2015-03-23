class UsersController < ApplicationController
  def new
		@user = User.new
  end

	def show
		@user = User.find(params[:id])
	end

	def create
		logger.debug("users controller -- call create method")
		@user = User.new(user_params)
		@user.user_id = @user.id
		if @user.save
			flash[:success] = "Welcome to the Skeleton Site"
			redirect_to "/users/#{@user.id}"
		else
			render 'new'
		end 
	end

	private
	def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation )
	end

end
