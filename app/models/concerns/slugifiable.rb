require 'pry'
module Slug

  def slug
    self.name.gsub(" ", "-").downcase
  end
end

module ClassSlug

  def find_by_slug(name)
    self.all.detect { |n| n.slug == name }
  end
end
