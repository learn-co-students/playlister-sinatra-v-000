class Slugifiable

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    slugged = []
    slug.split("-").each {|phrase| name << phrase.capitalize}
    find_by(name: slugged.join(" "))
  end

end
