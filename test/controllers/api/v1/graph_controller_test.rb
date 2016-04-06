require 'test_helper'

class Api::V1::GraphControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    result = {
      :sports => [
        :sub_category => "culture_and_sports_culture",
        links: {
          self: {
            href: "/api/api/v1/category/culture_and_sports_culture",
            method: "GET",
            rel: "self"
          },
          next: {
            href: "/api/v1/category/sports",
            method: "GET",
            rel: "_next"
          },
          graph: {
            href: "/api/v1/graph/culture_and_sports_culture",
            method: "GET",
            rel: "graph"
          }
        }
      ]
    }

    get api_v1_graph_show_url "sports"
    assert_response :success
    assert_equal result.to_json, @response.body
  end

end
