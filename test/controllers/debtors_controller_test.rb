require "test_helper"

class DebtorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get debtors_index_url
    assert_response :success
  end

  test "should get show" do
    get debtors_show_url
    assert_response :success
  end

  test "should get new" do
    get debtors_new_url
    assert_response :success
  end

  test "should get create" do
    get debtors_create_url
    assert_response :success
  end

  test "should get edit" do
    get debtors_edit_url
    assert_response :success
  end

  test "should get update" do
    get debtors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get debtors_destroy_url
    assert_response :success
  end
end
