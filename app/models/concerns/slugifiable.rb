module Slugifiable
  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def find_by_slug(s)
    self.all.find {|i| i.slug == s}
  end
end
