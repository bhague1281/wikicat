require 'test_helper'

class Api::V1::CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    result = {
      :category => {
        :title => "science",
        :sub_categories => 1
      }
    }

    get api_v1_category_url "science"
    assert_response :success
    assert_equal result.to_json, @response.body
  end
end
