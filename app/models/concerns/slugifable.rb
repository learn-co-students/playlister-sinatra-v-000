module Slugifable
  def self.included(base)
    base.extend(ClassMethods)
  end
  def slug
    self.name.gsub(" ","-").downcase
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |object| object.slug == slug }
    end
  end
end
