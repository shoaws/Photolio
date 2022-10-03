require "test_helper"

class Public::PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_photos_index_url
    assert_response :success
  end

  test "should get show" do
    get public_photos_show_url
    assert_response :success
  end
end
