require "application_system_test_case"

class PhotosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit photos_url
  
    assert_selector "a", text: "Instautomation"
    assert_selector "a", text: "Home"
  end
end
