class CategorySerializer < ActiveModel::Serializer
  attributes :title, :sub_categories

  def title
    object.cat_title.downcase.tr(" ", "_")
  end

  def sub_categories
    object.cat_subcats
  end
end
