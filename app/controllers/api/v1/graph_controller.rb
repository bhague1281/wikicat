class Api::V1::GraphController < ApplicationController
  def show
    category = params[:category] || 'sports'
    @category = Category.find_by_cat_title(category)
    @links = Link.where(:cl_to => @category.cat_title,
                        :cl_type => "subcat")
    render :json => @links,
    each_serializer: LinkSerializer,
    root: @category.cat_title.downcase
  end

  private

  def graph_params
    params.require(:category).permit(:cl_to, :cl_type)
  end
end
