class AnonymousController < ApplicationController

	def new
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@anonymous = Anonymous.new
	end


	def create
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		@anonymous = Anonymous.new(anonymous_params)
		if @anonymous.save
			flash[:success] = "Welcome to the this site"
			redirect_to "/anonymous/#{@anonymous.id}"
		else
			render 'root_path'
		end
	end

	def update

	end

	private
		def anonymous_param


		end



end
