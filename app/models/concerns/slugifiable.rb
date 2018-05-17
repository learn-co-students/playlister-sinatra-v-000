module Slugifiable

  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def find_by_slug(slug)
    self.all.find {|s| s.slug == slug}
  end

end
