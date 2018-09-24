require 'test_helper'

class PrivaciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get privacies_index_url
    assert_response :success
  end

end
