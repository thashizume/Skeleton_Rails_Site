#codign: utf-8
require 'spec_helper'

describe "User Pages" do

	subject {page}

	describe "signup page" do
		it "Titleの確認" do
			visit '/signup'
			expect(page).to have_title('Sign Up')
		end
	end

end
