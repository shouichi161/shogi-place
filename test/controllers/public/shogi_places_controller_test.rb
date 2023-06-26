require "test_helper"

class Public::ShogiPlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_shogi_places_new_url
    assert_response :success
  end

  test "should get index" do
    get public_shogi_places_index_url
    assert_response :success
  end

  test "should get show" do
    get public_shogi_places_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_shogi_places_edit_url
    assert_response :success
  end
end
