module SlugName

  def slug
    self.name.downcase.split(" ").join("-")
  end

end

module Slugify

  def find_by_slug(slug)
    unslugged = slug.split("-").map {|part| part.capitalize}.join(" ")
    self.find_by(name: unslugged)
  end

end
