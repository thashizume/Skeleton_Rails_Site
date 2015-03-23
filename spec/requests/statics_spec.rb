#coding: utf-8
require 'spec_helper'

describe "静的ページのテスト" do

	subject {page}


#	describe "Home" do
#		it "should have the content 'Skeleton'" do
#			visit '/static/home'
#			expect(page).to have_content('site')
#		end
#	end

	it "link test" do
		visit root_path 
		click_link "About US"
		expect(page).to have_title("About US")
		click_link "Help"
		expect(page).to have_title("Help")
		click_link "Home"
		click_link "Sign In"
		expect(page).to have_title("Sign Up")



	end



end
