#coding: utf-8
class User < ActiveRecord::Base
	before_save {self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:name, presence: true, uniqueness: true, length: {maximum: 50})
	validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true )
	validates(:password, presence: true, length: {minimum: 6})
	has_secure_password

	def User.new_remember_token
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		SecureRandom.urlsafe_base64
	end

	#
	#	SessionHelperi からコールされる
	#
	def User.encrypt(token)
		logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
		logger.debug("********** #{File.basename(__FILE__)} token string: #{token.to_s}")
		logger.debug("********** #{File.basename(__FILE__)} token digest: #{Digest::SHA1.hexdigest(token.to_s)}")
		return Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			logger.debug("********** #{File.basename(__FILE__)} #{__method__}")
			salf.remember_token = User.encrypt(User.new_remember_token)
		end


end
