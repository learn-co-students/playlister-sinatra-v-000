module Slugifiable

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def find_by_slug(slug)
    self.all.find {|x| x.slug == slug}
  end

end