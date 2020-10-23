require 'test_helper'

class InstautomationFlowTest < ActionDispatch::IntegrationTest
  setup do
    @photo_one = photos(:one)
    @photo_two = photos(:two)
  end

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

  test "can see added photos in the index page" do 
    post "/photos", params: { photo: { description: @photo_one.description, picture: @photo_one.picture } }
    post "/photos", params: { photo: { description: @photo_two.description, picture: @photo_two.picture } }

    get "/"

    assert_select "p", text: @photo_one.description
    assert_select "p", text: @photo_two.description
  end
end
