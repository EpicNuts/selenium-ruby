require 'selenium-webdriver'
class PageElements_login

  def initialize(url)
    @driver=Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.navigate.to url
  end

  def login_username()
    return @driver.find_element(:id,'a0-signin_easy_email')
  end

  def login_password()
    return @driver.find_element(:id,'a0-signin_easy_password')
  end

  def submit_button()
    return @driver.find_element(:type,'submit')
  end

  def logout_link()
    @driver.find_element(:link_text,'Logout')
  end

  def close_browser()
    @driver.quit
  end
end