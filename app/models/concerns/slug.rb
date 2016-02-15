module Slug
  def slug
    self.name.downcase.gsub(/[^0-9a-z ]/, "").gsub(" ", "-")
  end
end

module FindBySlug
  def find_by_slug(slug_to_find)
    self.all.find { |item| item.slug == slug_to_find }
  end
end