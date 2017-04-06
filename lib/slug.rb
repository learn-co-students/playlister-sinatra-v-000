class Slug
  def self.slugify(name)
    name.downcase.gsub(" ","-")
  end
end
