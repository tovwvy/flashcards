require "test_helper"

class LearnEngControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learn_eng_index_url
    assert_response :success
  end
end
