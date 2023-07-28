require "test_helper"

class DebtsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get debts_index_url
    assert_response :success
  end
end
