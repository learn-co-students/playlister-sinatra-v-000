module FindBySlug

  def find_by_slug(slug)
    self.all.find{ |artist| artist.slug == slug}
  end
end