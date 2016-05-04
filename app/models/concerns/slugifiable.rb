module Slugifiable

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def find_by_slug(slug)
    self.find do |entry|
      slug == entry.slug
    end
  end

end