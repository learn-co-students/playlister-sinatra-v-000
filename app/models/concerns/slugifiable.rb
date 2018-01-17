module Slugify
  def slug
    self.name.gsub(" ", "-").downcase
  end
end


module SlugFindBy
  def find_by_slug(slug)
    self.all.find {|instance| instance.slug == slug}
  end
end
