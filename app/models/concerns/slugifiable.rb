module Slugifiable

  def slug
    self.name.downcase.split(" ").join("-")
  end

end

module MetaSlugifiable

  def find_by_slug(slug)
    slug = slug.split("-").map {|word| word.capitalize }.join(" ")
    self.find_by(name: slug)
  end

end