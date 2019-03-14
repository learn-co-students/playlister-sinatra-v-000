
  def slug
    name.downcase.gsub(" ","-")
  end

  def find_by_slug(slug)
    self.all.find{|artist| artist.slug == slug}
  end
