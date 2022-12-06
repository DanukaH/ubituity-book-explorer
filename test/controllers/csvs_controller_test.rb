require "test_helper"

class CsvsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csvs_index_url
    assert_response :success
  end

  test "should get new" do
    get csvs_new_url
    assert_response :success
  end
end
