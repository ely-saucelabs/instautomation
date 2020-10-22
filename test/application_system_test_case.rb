require "test_helper"

Webdrivers::Geckodriver.update

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Selenium driving Firefox in a headless configuration
  driven_by :selenium_headless, screen_size: [1400, 1400]
end
