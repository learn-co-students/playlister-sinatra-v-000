require 'pry'
module Slug

  def slug
    self.name.gsub(" ", "-").downcase
  end
end

module ClassSlug

  def find_by_slug(name)
    binding.pry
    find(name.gsub("-", " ").titleize)
  end
end
