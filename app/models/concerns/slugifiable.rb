module Slug

  def slug
    self.name.gsub(" ", "-").downcase
  end
end

module ClassSlug

  def find_by_slug(name)
    self.find_by(:name => name.gsub("-", " ").titleize)
  end
end
