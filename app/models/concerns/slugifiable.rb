module Slugifiable

  def self.included(base)
    base.extend ClassMethods
  end

  def slug
    slug = self.name.downcase
    slug.gsub!(/[^a-zA-Z\d\s-]/, '')
    slug.gsub!(/\s/, '-')
    slug
  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.find do |object|
        object.slug == slug
      end
    end

  end

end
