#codign: utf-8
class Anonymous < ActiveRecord::Base
	validates(:nickname, 
						presence: true, 
						uniqueness: true, 
						length: {minimum: 6, maximum:30}
	)

	validates(:password, 
						presence: true,
						length:{minimum:6}
	)


	#	Passwordの暗号化を行う
	has_secure_password

#	fN = File.basename(__FILE__)
	
	def Anonymous.new_token
		SecureRandom.urlsafe_base64	
	end

	def Anonymous.encrypt(token)
		return Digest::SHA1.hexdigest(token.to_s)	
	end

	def Anonymous.signin(token)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}:signin")
		# new_token = Anonymous.encrypt( Anonymous.new_token )
		new_token = create_token
		salf.token = new_token
		salf.last_login = Date.today
		return new_token
	end

	private
		def create_token
			logger.debug("********** #{File.basename(__FILE__)} #{__method__}:create token")
			salf.token = Anonymous.encrypt( Anonymous.new_token )	
		end	


end
