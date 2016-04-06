require 'test_helper'

class Api::V1::GraphControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_graph_url "sports"
    assert_response :success
    assert_equal "{\"sports\":[{\"sub_category\":\"culture_and_sports_culture\"}]}",
                 @response.body
  end

end
