require 'test_helper'

class Api::V1::GraphControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    result = {
      :sports => [
        :sub_category => "culture_and_sports_culture"
      ]
    }

    get api_v1_graph_show_url "sports"
    assert_response :success
    assert_equal result.to_json, @response.body
  end

end
