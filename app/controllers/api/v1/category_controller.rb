class Api::V1::CategoryController < ApplicationController
  def show
    category = params[:category] || "Main_topic_classifications"
    @category = Category.find_by_cat_title(category)

    if @category
      render :json => @category,
      serializer: CategorySerializer,
      root: "category"
    else
      render :json => {
        :error => {
          :text => "404 not found",
          :status => 404
        }
      }
    end
  end
end
