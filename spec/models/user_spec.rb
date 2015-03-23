require 'spec_helper'

describe User do

	before { @user = User.new(user_id: "1",	provider: "provider", uid: "uid",	acesss_token: "token",	access_secret: "secret",	name: "example name",	nickname: "nick",	email: "anonymous@nobody.com",	url: "url",	image_url: "image",	description: "desc",	other: "other")	}

	subject{@user}

	it "columns" do
		expect(@user).to respond_to(:user_id)

	end


end
