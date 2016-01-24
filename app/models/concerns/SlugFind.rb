module SlugFind
  def find_by_slug(slug)
    self.all.find{|item| item.slug == slug}
  end
end