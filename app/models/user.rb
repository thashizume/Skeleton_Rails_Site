class User < ActiveRecord::Base
	before_save {self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:name, presence: true, uniqueness: true, length: {maximum: 50})
	validates(:email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true )
	#validates(:password, presence: true, length: {minimum: 6})
#	has_secure_password
end
