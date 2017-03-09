module Slugifiable
  def slug
    self.name.gsub(' ','-').downcase
  end

  def find_by_slug(slug)
    all.detect {|x| x.slug == slug}
  end
end
