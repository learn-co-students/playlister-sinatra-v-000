# Each class you build will need to have a method to slugify each object's name. This means you'll need to strip out any special characters, and replace all spaces with -.

class Slugify

  def self.slug(name)
    name.gsub(/\s/,'-').downcase
  end

  def self.unslug(slug)
    slug.to_s.gsub(/-/,' ').titleize
  end

end
