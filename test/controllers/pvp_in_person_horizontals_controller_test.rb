require "test_helper"

class PvpInPersonHorizontalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pvp_in_person_horizontals_index_url
    assert_response :success
  end
end
