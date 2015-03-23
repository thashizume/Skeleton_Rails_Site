require 'spec_helper'

describe User do

	before { @user = User.new(user_id: "1",	provider: "provider", uid: "uid",	access_token: "token",	access_secret: "secret",	name: "example name",	nickname: "nick",	email: "anonymous@nobody.com",	url: "url",	image_url: "image",	description: "desc",	other: "other")	}

	subject{@user}

	it "check database columns" do
		expect(@user).to respond_to(:user_id)
		expect(@user).to respond_to(:provider)
		expect(@user).to respond_to(:uid)
		expect(@user).to respond_to(:access_token)
		expect(@user).to respond_to(:access_secret)
		expect(@user).to respond_to(:name)
		expect(@user).to respond_to(:nickname)
		expect(@user).to respond_to(:email)
		expect(@user).to respond_to(:url)
		expect(@user).to respond_to(:image_url)
		expect(@user).to respond_to(:description)
		expect(@user).to respond_to(:other)
#		expect(@user).to respond_to(:passwprd)

	end


end
