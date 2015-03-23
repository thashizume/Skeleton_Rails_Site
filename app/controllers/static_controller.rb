class StaticController < ApplicationController
  def home
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		
  end

  def help
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
  end

  def aboutus
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
  end
end
