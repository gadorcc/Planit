require "test_helper"

class OptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get options_create_url
    assert_response :success
  end
end
