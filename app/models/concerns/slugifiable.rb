class Slugifiable
  def self.slugify(name)
    array = name.split
    slug = array.join"-"
    slug.downcase
  end
end