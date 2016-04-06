class CategorySerializer < ActiveModel::Serializer
  attributes :title, :sub_categories, :_links

  def title
    URI::encode(object.cat_title
        .encode('ASCII', {replace: ''})
        .gsub(/\s+/, ' ').strip.downcase.tr(" ", "_"))
  end

  def sub_categories
    object.cat_subcats
  end

  def _links
    {:self => _self, :graph => _graph}
  end

  def _graph
    href = URI::encode("/api/v1/graph/#{self.title}")
    {:href => href, :method => "GET", :rel => "graph"}
  end

  def _self
    href = URI::encode("/api/v1/category/#{self.title}")
    {:href => href, :method => "GET", :rel => "self"}
  end
end
