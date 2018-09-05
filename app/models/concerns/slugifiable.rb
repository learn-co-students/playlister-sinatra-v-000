module SlugifiableInstanceMethods
  def slug
    self.name.gsub(" ", "-").downcase
  end
end

module SlugifiableClassMethods
  def find_by_slug(slug)
    self.all.find{ |instance| instance.slug == slug }
  end
end
