module Concerns::Findable
  def find_by_slug(slug_query)
    self.all.detect{|item| item.slug == slug_query }
  end
end