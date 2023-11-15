require "test_helper"

class TaskControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get task_new_url
    assert_response :success
  end

  test "should get create" do
    get task_create_url
    assert_response :success
  end

  test "should get edit" do
    get task_edit_url
    assert_response :success
  end
end
