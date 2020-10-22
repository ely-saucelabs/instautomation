require "application_system_test_case"

class PhotosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit photos_url
  
    assert_selector "a", text: "Instautomation"
    assert_selector "a", text: "Home"
  end

  test "can add a photo" do
    visit photos_url

    click_on "New Photo"
    fill_in "photo[description]", with: "Earthrise"
    attach_file "photo[picture]", file_fixture('picture.png')
    click_on "Add"

    assert_selector "p", text: "Earthrise"
  end
end
