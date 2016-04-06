require 'test_helper'

class Api::V1::CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    result = {
      :category => {
        :title => "science",
        :sub_categories => 1,
        _links: {
          self: {
            href: "/api/v1/category/science",
            method: "GET",
            rel: "self"
          },
          graph: {
            href: "/api/v1/graph/science",
            method: "GET",
            rel: "graph"
          }
        }
      }
    }

    get api_v1_category_show_url "science"
    assert_response :success
    assert_equal result.to_json, @response.body
  end
end
