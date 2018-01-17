module SlugName

  def slug
    self.name.downcase.split(" ").join("-")
  end

end

module Slugify

  def find_by_slug(slug)
    self.all.find {|instance| instance.slug == slug}
  end

end
