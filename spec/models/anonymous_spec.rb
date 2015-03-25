require 'spec_helper'

describe Anonymous do

	describe "column check" do
		context "column check 1st" do
			it "column exist" do
				@anonymous = Anonymous.new(
					nickname: "nickname"  , password: "password")

				expect(@anonymous).to respond_to(:nickname)
#				expect(@anonymous).to respond_to(:password)
				expect(@anonymous).to respond_to(:password_digest)
				expect(@anonymous).to respond_to(:token)
				expect(@anonymous).to respond_to("last_login")
			end
		end
	end

	describe "data validate" do
		context "insert check" do
			it "nickneme, password ok" do
				@anonymous = Anonymous.new(
						nickname: "nickname"	, password: "password")	
			end
		end
	end


	#
	#
	describe "method test" do
		context "crypt" do
			it "token" do
				@anonymous = Anonymous.new(
					nickname: "nickname"  , password: "password")

#				@anonymous.signin("hohohohohoho").should_not be_nil
			end
		end
	end

end
