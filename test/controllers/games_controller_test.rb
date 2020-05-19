require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get games_show_url
    assert_response :success
  end

  test "should get create" do
    get games_create_url
    assert_response :success
  end

  test "should get update" do
    get games_update_url
    assert_response :success
  end

  test "should get delete" do
    get games_delete_url
    assert_response :success
  end

end
