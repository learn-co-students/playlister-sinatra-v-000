class Slug < ActiveRecord::Base
  def self.slug
    self.name = self.name.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
  end
end
