module ApplicationHelper
	
	def full_title(page_title)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")	
		base_title = "Skeleton Web Site:app/helper/application_helper.rb"
		if page_title.empty?
			return base_title
		else
			return "#{page_title} | #{base_title}"
		end
	end


end
