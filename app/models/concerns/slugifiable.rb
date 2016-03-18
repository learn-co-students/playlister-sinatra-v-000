module Slugify
  def slug
    self.name.gsub(' ', '-').downcase
  end

  def find_by_slug(slug)
    self.all.detect{|instance| instance.slug == slug}
  end

end