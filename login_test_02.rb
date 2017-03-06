# filename: login_test.rb

require 'test/unit'
require 'selenium-webdriver'
require_relative 'page_elements_login.rb'

class MyTest < Test::Unit::TestCase

  	def tearup
 		browser = PageElements_login.new("https://ota-plus-web-staging.atsgarage.com/login")
 	end

  	def test_login
	    #input username
	    browser.login_username.send_keys('*****')

	    #input password
		browser.login_password.send_keys('*****')

		#click on submit button
		browser.submit_button.click

	    #wait until the Logout link displays, timeout in 10 seconds
	    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
	    wait.until {@driver.find_element(:link_text => "Logout") }

	    #define logout link
	    logoutLink=@driver.find_element(:link_text,'Logout')
	    #if logout link is displayed
	    isLogoutLinkDisplayed=logoutLink.displayed?

	    puts isLogoutLinkDisplayed

	    #do assertion on logout link
	    assert_equal(true,isLogoutLinkDisplayed,'logout button display')
	end

	def teardown
	   	#quit the driver
		@driver.quit
	end


end