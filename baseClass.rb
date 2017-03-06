# filename: baseClass.rb

require "selenium-webdriver"
require "test/unit"

class LoginTestCases < Test::Unit::TestCase

#________________________________________________________________

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://ota-plus-web-staging.atsgarage.com"
    @driver.manage.timeouts.implicit_wait = 10
    @verification_errors = []
    @wait = Selenium::WebDriver::Wait.new(timeout: 5)
  end

  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end

#________________________________________________________________

# def find_id(x)
#   @driver.find_element(:id, 'x')
# end

# def find_xpath(x)
#   @driver.find_element(:xpath, 'x')
# end

# def find_link(x)
#   @driver.find_element(:link, 'x')
# end

#________________________________________________________________

  def login_username()
    return @driver.find_element(:id,'a0-signin_easy_email')
  end

  def login_password()
    return @driver.find_element(:id,'a0-signin_easy_password')
  end

  def submit_button()
    return @driver.find_element(:xpath, '//*[@id="a0-onestep"]/div[2]/div/form/div[3]/div/button')
  end

  def forgot_password()
    return @driver.find_element(:xpath, '//*[@id="a0-onestep"]/div[2]/div/form/div[3]/a')
  end

  def profile_carat()
    return @driver.find_element(:xpath, '//*[@id="menuLogin"]/a/i')
  end

  def logout_link()
    return @driver.find_element(:xpath, '//*[@id="link-signout"]')
  end

  def home_icon()
    return @driver.find_element(:xpath, '//*[@id="app"]/div/div[2]/div/div/div/div[1]/div/div[2]/div')
  end

  def login_page_welcome_text()
    return @driver.find_element(:xpath, '//*[@id="a0-onestep"]/div[1]/div[2]/h1')
  end

  def github_login()
    return @driver.find_element(:xpath, '//*[@id="a0-onestep"]/div[2]/div/form/div[2]/div[2]/div[1]/div[1]')
  end

  def google_login()
    return @driver.find_element(:xpath, '//*[@id="a0-onestep"]/div[2]/div/form/div[2]/div[2]/div[1]/div[2]')
  end

#________________________________________________________________

  def test_login_UNAP
    @driver.get(@base_url+'/login')
    login_username.send_keys ""
    login_password.send_keys ""
    submit_button.click
    @wait.until { home_icon }
    successMessage = home_icon
    successMessage.text.eql? "Home"
  end

# NEG TESTING GOES HERE

  def test_login_Google
    @driver.get(@base_url+'/login')
    google_login.click
    @wait.until { @driver.page_source.include?("One account. All of Google.") } 
  end

  def test_login_Github
    @driver.get(@base_url+'/login')
    github_login.click
    @wait.until { @driver.page_source.include?("Sign into <strong>GitHub</strong>
             <br>to continue to <strong>ATS Garage Staging") } 
  end 

end