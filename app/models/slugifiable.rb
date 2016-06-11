module Slugify

  def slug
    self.name.downcase.gsub(' ', '-')
  end
end

module SlugFindBy
  def find_by_slug(slug)
    self.all.find {|item| item.slug == slug}
  end
end