class LinkSerializer < ActiveModel::Serializer
  attributes :sub_category
  def sub_category
    object.cl_sortkey.downcase.tr(" ", "_")
  end
end
