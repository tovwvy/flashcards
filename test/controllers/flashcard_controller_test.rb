require "test_helper"

class FlashcardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flashcard_index_url
    assert_response :success
  end
end
