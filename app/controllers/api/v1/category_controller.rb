class Api::V1::CategoryController < ApplicationController
  respond_to :json

  def show
    category = params[:category] ? params[:category] : "sports"
    @category = Category.find_by_cat_title(category)
    render :json => @category,
    serializer: CategorySerializer,
    root: "category"
  end
end
