module Concerns::Findable

  def find_by_slug(slug)
    self.all.find {|i| i if slug == i.slug}
  end
end  