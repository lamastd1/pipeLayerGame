require "test_helper"

class PvpOnlineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pvp_online_index_url
    assert_response :success
  end
end
