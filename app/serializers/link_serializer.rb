class LinkSerializer < ActiveModel::Serializer
  attributes :sub_category, :links
  def sub_category
    URI::encode(object.cl_sortkey.force_encoding("ISO-8859-1"))
        .encode("utf-8", replace: nil).downcase.gsub("%20", "_")
  end

  def links
    {:self => _self, :next => _next, :graph => graph}
  end

  def graph
    href = "/api/v1/graph/#{self.sub_category.downcase}"
    {:href => href, :method => "GET", :rel => "graph"}
  end

  def _self
    href = "api/api/v1/category/#{self.sub_category.downcase}"
    {:href => href, :method => "GET", :rel => "self"}
  end

  def _next
    href = "/api/v1/category/#{object.cl_to.downcase}"
    {:href => href, :method => "GET", :rel => "_next"}
  end
end
