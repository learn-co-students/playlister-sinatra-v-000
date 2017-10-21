#instance method
module Slug
  def slug
    self.name.downcase.gsub(/[^0-9a-z ]/, "").gsub(" ", "-") #first gsub removes all special characters except spaces, 0-9, and lowercase a-z
  end
end

#class method
module FindBySlug
  def find_by_slug(slug_to_find)
    self.all.find { |item| item.slug == slug_to_find }
  end
end