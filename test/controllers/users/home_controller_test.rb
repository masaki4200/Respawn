require 'test_helper'

class Users::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_home_top_url
    assert_response :success
  end

end
