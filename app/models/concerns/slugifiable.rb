
module Slugifiable 
  def slug
    self.name.slugify
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def self.find_by_slug(slugged)
    self.all.select do |obj|
       obj.slug == slugged 
    end
  end

  module ClassMethods
    def find_by_slug(slugged)
      self.all.select do |obj|
         obj.slug == slugged 
      end.first
    end
  end

end