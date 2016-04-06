class Api::V1::GraphController < ApplicationController
  def show
    category = params[:category] || "Main_topic_classifications"
    @category = Category.find_by_cat_title(category)

    if @category
      @links = Link.where(:cl_to => @category.cat_title,
                        :cl_type => "subcat")

      render :json => @links,
      each_serializer: LinkSerializer,
      root: @category.cat_title.downcase
    else
      render :json => {:error => {
          :text => "404 not found",
          :status => 404
        }
      }
    end
  end

  private

  # currently unused
  # def graph_params
  #   params.require(:category).permit(:cl_to, :cl_type)
  # end
end
