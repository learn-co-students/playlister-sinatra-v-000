module Slugifiable

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def find_by_slug(slug)
      slug = slug.gsub("-", " ").titleize
      self.find_by(name: slug)
    end
  end

  def slug
    self.name.gsub(" ", "-").downcase
  end

end
