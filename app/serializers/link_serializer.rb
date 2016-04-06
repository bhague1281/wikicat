class LinkSerializer < ActiveModel::Serializer
  attributes :sub_category, :links
  def sub_category
    URI::encode(object.cl_sortkey
        .encode('ASCII', {replace: ''})
        .gsub(/\s+/, ' ').strip.downcase.tr(" ", "_"))
  end

  def links
    {:self => _self, :next => _next, :graph => graph}
  end

  def graph
    href = URI::encode("/api/v1/graph/#{self.sub_category.downcase}")
    {:href => href, :method => "GET", :rel => "graph"}
  end

  def _self
    href = URI::encode("/api/api/v1/category/#{self.sub_category.downcase}")
    {:href => href, :method => "GET", :rel => "self"}
  end

  def _next
    href = URI::encode("/api/v1/category/#{object.cl_to.downcase}")
    {:href => href, :method => "GET", :rel => "_next"}
  end
end
