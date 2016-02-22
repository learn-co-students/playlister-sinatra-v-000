module Slugifiable

  def slug
    self.name.downcase.strip.gsub(' ', '-')
  end

  def find_by_slug(slug)
    self.all.find {|t| t.slug == slug}
  end

end