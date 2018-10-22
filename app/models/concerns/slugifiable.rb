require 'slugify'

class Slugifiable

  def self.slug(name)
    name.slugify
  end

  def slug
    self.name.slugify
  end

  def find_by_slug

  end

end
