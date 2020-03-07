require 'test_helper'

class Users::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_items_index_url
    assert_response :success
  end

  test "should get edit" do
    get users_items_edit_url
    assert_response :success
  end

  test "should get new" do
    get users_items_new_url
    assert_response :success
  end

end
