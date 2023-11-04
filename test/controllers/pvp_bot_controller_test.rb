require "test_helper"

class PvpBotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pvp_bot_index_url
    assert_response :success
  end
end
