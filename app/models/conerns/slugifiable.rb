module Slugify
  def slug
    self.name.downcase.strip.gsub(" ", "-")
  end
end

module FindBySlug
  include Slugify
  def find_by_slug(s)
    self.all.detect do |obj|
      obj if obj.slug == s
    end
  end
end