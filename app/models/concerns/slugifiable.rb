module Slugifiable

  def add_slug
    self.slug = self.name.downcase.split(" ").join("-") if self.name
  end

  def slug
    self.add_slug
    super
  end
end
