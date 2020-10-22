require 'test_helper'

class InstautomationFlowTest < ActionDispatch::IntegrationTest
  test "can see the index page" do
    get "/"

    assert_select "a", "Instautomation 📷"
    assert_select "a", "Home"
    assert_select "a", "About"
  end

  test "can see the about page" do 
    get "/pages/about"

    assert_select "h1", "About"
  end
end
